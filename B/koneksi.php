<?php

$koneksi = mysqli_connect("localhost", "root", "26070412", "olympic");

if (mysqli_connect_errno()){
    echo "Gagal". mysqli_connect_error();
}