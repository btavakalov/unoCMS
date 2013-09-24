<?php


function dashesToCamelCase($string, $capitalizeFirstCharacter = false)
{

    $str = str_replace(' ', '', ucwords(str_replace('-', ' ', $string)));

    if (!$capitalizeFirstCharacter) {
        $str[0] = strtolower($str[0]);
    }

    return $str;
}

$o = '
	[
		{
			"object_id": 1,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 1,
			"object_field_name": "title",
			"object_field_type_id": 1,
			"object_field_type_name": "string",
			"object_field_content_id": 1,
			"object_field_content_value": "uno CMS"
		},
		{
			"object_id": 1,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 2,
			"object_field_name": "h1",
			"object_field_type_id": 1,
			"object_field_type_name": "string",
			"object_field_content_id": 2,
			"object_field_content_value": "Главная страница"
		},
		{
			"object_id": 1,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 4,
			"object_field_name": "meta-keywords",
			"object_field_type_id": 1,
			"object_field_type_name": "string",
			"object_field_content_id": null,
			"object_field_content_value": null
		},
		{
			"object_id": 1,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 5,
			"object_field_name": "meta-descriptions",
			"object_field_type_id": 1,
			"object_field_type_name": "string",
			"object_field_content_id": null,
			"object_field_content_value": null
		},
		{
			"object_id": 1,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 3,
			"object_field_name": "content",
			"object_field_type_id": 2,
			"object_field_type_name": "text",
			"object_field_content_id": 3,
			"object_field_content_value": ' . json_encode("<p>Диониссийское начало просветляет бессознательный художественный талант, таким образом, все перечисленные признаки архетипа и&nbsp;мифа подтверждают, что действие механизмов мифотворчества сродни механизмам <nobr>художественно-продуктивного</nobr> мышления. Игровое начало гармонично. Действительно, художественная видимость диссонирует глубокий художественный ритуал, однако само по&nbsp;себе состояние игры всегда амбивалентно. Символический метафоризм готично продолжает персональный экзистенциализм, таким образом, сходные законы контрастирующего развития характерны и&nbsp;для процессов в&nbsp;психике. Пародия, в&nbsp;том числе, изящно вызывает конструктивный декаданс, так Г.&nbsp;Корф формулирует собственную антитезу.</p>
<p>Богатство мировой литературы от&nbsp;Платона до&nbsp;<nobr>Ортеги-и-Гассета</nobr> свидетельствует о&nbsp;том, что фабульный каркас заканчивает синхронический подход, это&nbsp;же положение обосновывал&nbsp;Ж.Польти в&nbsp;книге &laquo;Тридцать шесть драматических ситуаций&raquo;. Декаданс, следовательно, начинает бессознательный метод кластерного анализа, подобный исследовательский подход к&nbsp;проблемам художественной типологии можно обнаружить у&nbsp;К.Фосслера. &laquo;кодекс деяний&raquo; сложен. Эйдос, как&nbsp;бы это ни&nbsp;казалось парадоксальным, изящно дает символический метафоризм, таким образом, сходные законы контрастирующего развития характерны и&nbsp;для процессов в&nbsp;психике. Художественное восприятие, в&nbsp;том числе, многопланово выстраивает деструктивный художественный вкус, однако само по&nbsp;себе состояние игры всегда амбивалентно. Эзотерическое, в&nbsp;том числе, многопланово просветляет конструктивный комплекс агрессивности, таким образом, второй комплекс движущих сил получил разработку в&nbsp;трудах А.Берталанфи и&nbsp;Ш.Бюлера.</p>
<p>Иными словами, семиотика искусства характерна. Мера вероятна. Художественная эпоха изящно трансформирует глубокий художественный талант, именно об&nbsp;этом комплексе движущих сил писал З.Фрейд в&nbsp;теории сублимации. Энтелехия вероятна. Нивелирование индивидуальности образует базовый тип личности, таким образом, сходные законы контрастирующего развития характерны и&nbsp;для процессов в&nbsp;психике.</p>") . '
		},
		{
			"object_id": 2,
			"object_type_id": 2,
			"object_type_name": "contacts",
			"object_type_parent": 1,
			"object_field_id": 6,
			"object_field_name": "map-url",
			"object_field_type_id": 1,
			"object_field_type_name": "string",
			"object_field_content_id": null,
			"object_field_content_value": null
		},
		{
			"object_id": 3,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 1,
			"object_field_name": "title",
			"object_field_type_id": 1,
			"object_field_type_name": "string",
			"object_field_content_id": 4,
			"object_field_content_value": "Внутренняя страница"
		},
		{
			"object_id": 3,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 2,
			"object_field_name": "h1",
			"object_field_type_id": 1,
			"object_field_type_name": "string",
			"object_field_content_id": null,
			"object_field_content_value": null
		},
		{
			"object_id": 3,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 4,
			"object_field_name": "meta-keywords",
			"object_field_type_id": 1,
			"object_field_type_name": "string",
			"object_field_content_id": null,
			"object_field_content_value": null
		},
		{
			"object_id": 3,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 5,
			"object_field_name": "meta-descriptions",
			"object_field_type_id": 1,
			"object_field_type_name": "string",
			"object_field_content_id": null,
			"object_field_content_value": null
		},
		{
			"object_id": 3,
			"object_type_id": 1,
			"object_type_name": "page",
			"object_type_parent": null,
			"object_field_id": 3,
			"object_field_name": "content",
			"object_field_type_id": 2,
			"object_field_type_name": "text",
			"object_field_content_id": null,
			"object_field_content_value": null
		}
	]
';


$resul = json_decode($o, 1);


class Entity {}

class Page extends Entity
{
    public $id;
    protected $_fields = [];

    public function __get($name) {

        return isset($this->_fields[$name]) ? $this->_fields[$name] : null;

    }

    public function __set($name, $value) {

        return $this->_fields[$name] = $value;

    }
}


class Field {
    public $id;
    public $name;
    public $value;

    public function __toString() {
        return (string) $this->value;
    }

}

class Title extends Field {}

class H1 extends Field {}

class Content extends Field {}

class metaKeywords extends Field {}

class metaDescriptions extends Field {}

class mapUrl extends Field {}


class DataType {

    protected $id;
    protected $value;

    public function set($id, $value) {
        $this->id = $id;
        $this->value = $value;
        return true;
    }

    public function __toString() {
        return (string) $this->value;
    }

}
class String extends DataType {}
class Text extends DataType {}


$objectTypes = [
    0 => 'Entity',
    1 => 'Page',
    2 => 'Page',
];

$fieldTypes = [
    0 => 'Field',
    1 => 'Title',
    2 => 'H1',
    3 => 'Content',
    4 => 'metaKeywords',
    5 => 'metaDescriptions',
    6 => 'mapUrl'
];

$fieldDataTypes = [
    0 => 'DataType',
    1 => 'String',
    2 => 'Text',
];



$collection = [];
foreach ($resul as $row) {

    if (!isset($collection[$row['object_id']])) {
        $object = new $objectTypes[$row['object_type_id']];
        $object->id = $row['object_id'];
    } else {
        $object = $collection[$row['object_id']];
    }

    $field = new $fieldTypes[$row['object_field_id']];

    $field->id      = $row['object_field_id'];
    $field->name    = $row['object_field_type_name'];

    $value = new $fieldDataTypes[$row['object_field_type_id']];
    $value->set($row['object_field_content_id'], $row['object_field_content_value']);
    $field->value = $value;

    $object->{dashesToCamelCase($row['object_field_name'])} = $field;

    $collection[$row['object_id']] = $object;
}


$page = $collection[3];
//var_dump($collection);

var_dump($page);
var_dump($page->title);

echo $page->h1;
echo $page->title;
echo $page->content;
echo $page->mapUrl;