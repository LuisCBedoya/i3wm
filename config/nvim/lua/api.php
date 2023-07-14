<?php
if ($_SERVER['REQUEST_METHOD'] == "POST") {
            extract($_POST);
                } elseif ($_SERVER['REQUEST_METHOD'] == "GET") {
    extract($_GET);
}

    function GetStr($string, $start, $end) {
    $str = explode($start, $string);
        $str = explode($end, $str[1]);  
    return $str[0];
}
function inStr($string, $start, $end, $value) {
    $str = explode($start, $string);
    $str = explode($end, $str[$value]);
    return $str[0];
}
?>
