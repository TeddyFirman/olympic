<?php

function fibonaci($n) {
    if ($n <= 1) {
        return $n;
    }

    return fibonaci($n -1) + fibonaci($n -2);
}

for ($i=0; $i < 13; $i++) { 
    echo fibonaci($i) ." ";
}
