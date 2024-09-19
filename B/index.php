<?php

session_start();
require 'koneksi.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <h1>Soal Nomer 1</h1>
    <br>
    <table border="2">
        <tr class="head">
            <td>No.</td>
            <td>Nomor Order</td>
            <td>Tanggal Order</td>
            <td>Nama Customer</td>
            <td>Alamat Customer</td>
            <td>Kota Customer</td>
            <td>Provinsi Customer</td>
            <td>Nama Toko</td>
            <td>Nama Ekspedisi</td>
            <td>Total Harga</td>
        </tr>
        <?php
        include 'koneksi.php';
        $no = 1;
        $data = mysqli_query($koneksi, "SELECT DISTINCT mar_tra_order.id AS 'nomor order', mar_tra_order.created_at AS 'tanggal order', mar_mas_customer.name AS 'nama customer', mar_mas_customer.address AS 'alamat customer', mar_mas_customer.city AS 'kota customer', mar_mas_customer.province AS 'provinsi customer', mar_mas_marketplace.store_name AS 'nama toko', mar_mas_expedition.name AS 'nama ekspedisi', SUM(mar_mas_item.price * mar_tra_order_detail.qty) AS 'total harga' FROM mar_tra_order_detail JOIN mar_tra_order ON mar_tra_order_detail.order_id = mar_tra_order.id JOIN mar_mas_customer ON mar_tra_order.customer_id = mar_mas_customer.id JOIN mar_mas_marketplace ON mar_tra_order.marketplace_id = mar_mas_marketplace.id JOIN mar_mas_expedition ON mar_tra_order.expedition_id = mar_mas_expedition.id JOIN mar_mas_item ON mar_tra_order_detail.item_id = mar_mas_item.id GROUP BY mar_tra_order_detail.created_at; ");
        while ($d = mysqli_fetch_array($data)) {
        ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $d['nomor order']; ?></td>
                <td><?php echo $d['tanggal order']; ?></td>
                <td><?php echo $d['nama customer']; ?></td>
                <td><?php echo $d['alamat customer']; ?></td>
                <td><?php echo $d['kota customer']; ?></td>
                <td><?php echo $d['provinsi customer']; ?></td>
                <td><?php echo $d['nama toko']; ?></td>
                <td><?php echo $d['nama ekspedisi']; ?></td>
                <td><?php echo $d['total harga']; ?></td>
            </tr>
        <?php
        }
        ?>
    </table>

    <br>
    <h1>Soal Nomer 2</h1>
    <br>
    <table border="2">
        <tr class="head">
            <td>No.</td>
            <td>Nama Item</td>
            <td>Brand</td>
            <td>Total Kuantiti yang terjual</td>
        </tr>
        <?php
        include 'koneksi.php';
        $no = 1;
        $data = mysqli_query($koneksi, "SELECT mar_mas_item.name 'nama item', mar_mas_item.brand 'brand', SUM(mar_tra_order_detail.qty) AS 'total quantity yang terjual' FROM mar_tra_order_detail  JOIN mar_mas_item ON mar_tra_order_detail.item_id = mar_mas_item.id GROUP BY mar_mas_item.name ORDER BY SUM(mar_tra_order_detail.qty) DESC; ");
        while ($d = mysqli_fetch_array($data)) {
        ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $d['nama item']; ?></td>
                <td><?php echo $d['brand']; ?></td>
                <td><?php echo $d['total quantity yang terjual']; ?></td>
            </tr>
        <?php
        }
        ?>
    </table>

    <br>
    <h1>Soal Nomer 3</h1>
    <br>
    <table border="2">
        <tr class="head">
            <td>No.</td>
            <td>Brand</td>
            <td>Total Kuantiti yang terjual</td>
        </tr>
        <?php
        include 'koneksi.php';
        $no = 1;
        $data = mysqli_query($koneksi, "SELECT mar_mas_item.brand 'brand', SUM(mar_tra_order_detail.qty) AS 'total quantity yang terjual' FROM mar_tra_order_detail  JOIN mar_mas_item ON mar_tra_order_detail.item_id = mar_mas_item.id GROUP BY mar_mas_item.brand; ");
        while ($d = mysqli_fetch_array($data)) {
        ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $d['brand']; ?></td>
                <td><?php echo $d['total quantity yang terjual']; ?></td>
            </tr>
        <?php
        }
        ?>
    </table>

    <br>
    <h1>Soal Nomer 3</h1>
    <br>
    <table border="2">
        <tr class="head">
            <td>No.</td>
            <td>Nama Ekspedisi</td>
            <td>Total Order</td>
        </tr>
        <?php
        include 'koneksi.php';
        $no = 1;
        $data = mysqli_query($koneksi, "SELECT mar_mas_expedition.name AS 'nama ekspedisi', COUNT(mar_tra_order.expedition_id) AS 'total order' FROM mar_tra_order JOIN mar_mas_expedition ON mar_tra_order.expedition_id = mar_mas_expedition.id GROUP BY mar_mas_expedition.name; ");
        while ($d = mysqli_fetch_array($data)) {
        ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $d['nama ekspedisi']; ?></td>
                <td><?php echo $d['total order']; ?></td>
            </tr>
        <?php
        }
        ?>
    </table>
</body>

</html>