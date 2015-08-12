<?php

mysql_connect('localhost', 'root', '');
mysql_select_db('chat');


$ins =  mysql_query("
  INSERT INTO
    messages (login, message, time)
  VALUES (
    '". $_POST['login'] ."',
    '". $_POST['message'] ."',
    '". $_POST['time'] ."')");