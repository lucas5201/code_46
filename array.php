<?php

echo 
<<<HTML
<style>
    th, td 
    {
        border: 1px solid black;
    }
</style>

<table>
    <tr>
        <th colspan="2">Test</th>
    </tr>

    <tr>
        <td rowspan="2">123</td>
        <td>456</td>
    </tr>

    <tr>
        <td>789</td>
    </tr>
</table>
HTML;