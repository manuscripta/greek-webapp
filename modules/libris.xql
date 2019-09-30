xquery version "3.0";

module namespace libris="http://www.manuscripta.se/xquery/libris";

import module namespace templates="http://exist-db.org/xquery/templates" ;
import module namespace config="http://www.manuscripta.se/xquery/config" at "config.xqm";

declare namespace marc = "http://www.loc.gov/MARC21/slim";
declare namespace ms = "http://www.manuscripta.se/ns/1.0";

declare %templates:wrap 
(: The %templates:wrap annotation copies the wrapper element :)
function libris:handskrifter($node as node(), $model as map(*)) {
for $record in doc($config:data-root || "/libris/kb-fornsvenska-latin.xml")//marc:record
(:for $record in doc($config:data-root || "/libris/handskrifter.xml")//marc:record:)
(:for $record in doc('http://libris.kb.se/xsearch?query=(BIBL:S%20MAT:handskrifter%20H8XX:HS20??)&amp;format=marcxml&amp;order=chronological&amp;format_level=full&amp;holdings=true&amp;n=100')//marc:record:)
(:for $record in doc('http://libris.kb.se/xsearch?query=(BIBL:S%20MAT:handskrifter%20SPR:(9fs%20OR%20lat))&amp;format=marcxml&amp;order=chronological&amp;format_level=full&amp;holdings=true&amp;n=200'):)
let $hyllsignum := data($record/marc:datafield[@tag = "852"]/marc:subfield[@code = "j"])
let $titel := data($record/marc:datafield[@tag = "245"]/marc:subfield)
let $datering := data($record/marc:datafield[@tag = "264"]/marc:subfield[@code = "c"])
let $LibrisID := data($record/marc:controlfield[@tag = "001"])
let $digiID := data($record/marc:datafield[@tag = "776"]/marc:subfield[@code = "w"])
let $katalogisator := data($record/marc:datafield[@tag = "852"]/marc:subfield[@code = "x"][2])
let $skapad := data(concat("20",substring($record/marc:controlfield[@tag = "008"],1,6)))
let $uppdaterad := data(substring($record/marc:controlfield[@tag = "005"],1,8))
return
    <tr>
        <td>{$hyllsignum}</td>
        <td>{$titel}</td>
        <td>{$datering}</td>
        <td><a href="http://libris.kb.se/bib/{$LibrisID}">{$LibrisID}</a></td>
        <td><a href="http://libris.kb.se/bib/{$digiID}">{$digiID}</a></td>
        <td>{$katalogisator}</td>
        <td>{$skapad}</td>
        <td>{$uppdaterad}</td>
    </tr>
};

declare %templates:wrap 
(: The %templates:wrap annotation copies the wrapper element :)
function libris:dihs($node as node(), $model as map(*)) {
for $record in doc($config:data-root || "/libris/dihs.xml")//marc:record
(:for $record in doc('http://libris.kb.se/xsearch?query=(db:dihs)&amp;format=marcxml&amp;order=-chronological&amp;format_level=full&amp;start=1&amp;n=300')//marc:record:)
(:let $hyllsignum := data($record/marc:datafield[@tag = "245"]/marc:subfield[@code = "b"]):)
let $hyllsignum := if (exists($record/marc:datafield[@tag='024']/marc:subfield[@code='2'][.='KB-signum'])) then data($record/marc:datafield[@tag='024']/marc:subfield[@code='2'][.='KB-signum']/preceding-sibling::marc:subfield) else data($record/marc:datafield[@tag = "245"]/marc:subfield[@code = "b"])
let $titel := data($record/marc:datafield[@tag = "245"]/marc:subfield[@code = "a"])
let $datering := data($record/marc:datafield[@tag = "260"]/marc:subfield[@code = "c"])
let $omfang := data($record/marc:datafield[@tag = "300"]/marc:subfield[@code = "a"])
let $LibrisID := data($record/marc:controlfield[@tag = "001"])
let $originalPost := data($record/marc:datafield[@tag = "776"]/marc:subfield[@code = "w"])
let $katalogisator := data($record/marc:datafield[@tag = "852"]/marc:subfield[@code = "x"][2])
let $skapad := data(concat("20",substring($record/marc:controlfield[@tag = "008"],1,6)))
let $uppdaterad := data(substring($record/marc:controlfield[@tag = "005"],1,8))
return
    <tr>
        <td>{$hyllsignum}</td>
        <td>{$titel}</td>
        <td>{$datering}</td>
        <td>{$omfang}</td>
        <td><a href="http://libris.kb.se/bib/{$LibrisID}">{$LibrisID}</a></td>
        <td><a href="http://libris.kb.se/bib/{$originalPost}">{$originalPost}</a></td>
        <td>{$katalogisator}</td>
        <td>{$skapad}</td>
        <td>{$uppdaterad}</td>
    </tr>
};


declare %templates:wrap 
(: The %templates:wrap annotation copies the wrapper element :)
function libris:kb-medeltida($node as node(), $model as map(*)) {
for $record in doc($config:data-root || "/libris/kb-medeltida.xml")//ms:ms
let $hyllsignum := data($record//ms:shelfmark)
let $titel := data($record//ms:summary)
let $datering := data($record//ms:date)
let $support := data($record//ms:support)
let $omfang := data($record//ms:extent)
let $height := data($record//ms:supportHeight)
let $width:= data($record//ms:supportWidth)
let $mfPos := data($record//ms:idno[contains(.,'pos.')])
let $mfNeg := data($record//ms:idno[contains(.,'neg.')])
let $LibrisID := data($record//ms:librisDigi)
return
    <tr>
        <td>{$hyllsignum}</td>
        <td>{$titel}</td>
        <td>{$datering}</td>
        <td>{$support}</td>
        <td>{$omfang}</td>
        <td>{$height}</td>
        <td>{$width}</td>
        <td><a href="http://libris.kb.se/bib/{$LibrisID}">{$LibrisID}</a></td>
        <td>{$mfPos}</td>
        <td>{$mfNeg}</td>                
    </tr>
};
