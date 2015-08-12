<?php

  mysql_connect('localhost', 'root', '');
  mysql_select_db('chat');

  $offset = $_GET['offset'];
  if (isset($_GET['default'])) {
    $where = empty($_GET['first'])? '' : "WHERE id > ".$_GET['first'];
  } else {
      $lastId = $_GET['last'];
      $where = "WHERE id < $lastId";
  }

  $query = mysql_query("
      SELECT
        *
      FROM
        messages
      $where
      ORDER BY id DESC
      LIMIT $offset");

  $messages = array();
  while ($row = mysql_fetch_array($query, MYSQL_ASSOC)) {
    $messages[] = $row;
  }

  echo (json_encode($messages));