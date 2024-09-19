<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Soal Nomer Dua</title>
</head>

<body>
    <?php
    function functionSoalNomorDua()
    {
        $dataAngka = "987654321";
        echo $dataAngka . "<br>";

        for ($i = 1; $i < strlen($dataAngka); $i++) {
            $dataAngka = substr($dataAngka, 0, strlen($dataAngka) - $i - 1) . substr($dataAngka, -$i) . $dataAngka[strlen($dataAngka) - $i - 1];
            echo $dataAngka . "<br>";
        }
    }

    functionSoalNomorDua();
    ?>
</body>

</html>