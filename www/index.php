<?php
$nodo = getenv('NODO_NOMBRE') ?: 'Desconocido';
echo "<h1>Respondiendo desde: $nodo</h1>";
echo "<p>Actualiza la página con F5 para ver cómo Nginx balancea el tráfico.</p>";

$pg = extension_loaded('pgsql') ? "<span style='color:green;'>OK</span>" : "<span style='color:red;'>Falta</span>";
$mongo = extension_loaded('mongodb') ? "<span style='color:green;'>OK</span>" : "<span style='color:red;'>Falta</span>";

echo "<h3>Estado de Drivers:</h3><ul>";
echo "<li>Driver PostgreSQL: $pg</li>";
echo "<li>Driver MongoDB: $mongo</li></ul>";
?>
