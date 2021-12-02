package;

import haxe.xml.Access;
import lime.utils.Assets;

using StringTools;

class Stage
{
    public static function accessXml(xmlInput:String):Access
    {
        var access = new Access(loadFromXml(xmlInput));

        return access;
    }

    public static function loadFromXml(xmlInput:String):Xml
    {
        var rawXml = Assets.getText(Paths.xml(xmlInput.toLowerCase())).trim();

        return parseXmlShit(rawXml);
    }

    public static function parseXmlShit(rawXml:String):Xml
    {
        var swagShit:Xml = Xml.parse(rawXml).firstElement();
		return swagShit;
    }
}