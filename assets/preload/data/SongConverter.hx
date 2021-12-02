package;

import sys.io.File;
import haxe.Json;
import sys.FileSystem;

class SongConverter
{
    static function main()
    {
        for (fileThing in FileSystem.readDirectory('./.'))
        {
            if (FileSystem.isDirectory(fileThing) && fileThing != 'smash')
            {
                trace('Formatting $fileThing');
                formatSong(fileThing);
            }
        }
    }

    public static function formatSong(songName:String)
    {
        var existsArray:Array<Bool> = [];
        var songFiles:Array<String> = [
            '$songName/$songName-easy.json',
            '$songName/$songName.json',
            '$songName/$songName-hard.json'
        ];

        existsArray.push(FileSystem.exists(songFiles[0]));
        existsArray.push(FileSystem.exists(songFiles[1]));
        existsArray.push(FileSystem.exists(songFiles[2]));

        if (!existsArray[0])
            songFiles[0] = songFiles[1];
        if (!existsArray[2])
            songFiles[2] = songFiles[1];

        var fileNormal:Dynamic = cast Json.parse(File.getContent(songFiles[0]));
        var fileHard:Dynamic = cast Json.parse(File.getContent(songFiles[1]));
        var fileEasy:Dynamic = cast Json.parse(File.getContent(songFiles[2]));

        var daOgNotes:Dynamic = fileNormal.song.notes;
        var daOgSpeed:Float = fileNormal.song.speed;

        fileNormal.song.notes = [];
        fileNormal.song.speed = [];

        fileNormal.song.notes.push(fileEasy.song.notes);
        fileNormal.song.notes.push(daOgNotes);
        fileNormal.song.notes.push(fileHard.song.notes);

        fileNormal.song.speed.push(fileEasy.song.speed);
        fileNormal.song.speed.push(daOgSpeed);
        fileNormal.song.speed.push(fileHard.song.speed);

        var daJson = Json.stringify(fileNormal);
        File.saveContent('$songName/$songName-new.json', daJson);
    }
}