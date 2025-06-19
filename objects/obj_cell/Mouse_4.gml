click_count += 1;

show_debug_message("Clic número: " + string(click_count));

// Animación de amor
var x_offset = random_range(-5, 5);
var y_offset = random_range(-8, -3);
instance_create_layer(x + x_offset, y + y_offset, "Instances", obj_reaction__love);

// Shake
shake_timer = 6;

// Evolución visual (solo una vez)
if (click_count == 10 && sprite_index != spr_cell__evolved) {
    sprite_index = spr_cell__evolved;
    image_xscale = 1.5;
    image_yscale = 1.5;
}

// Multiplicación celular (Versión CORREGIDA)
if (click_count == 25) {
    click_count = 0; // Reinicia el contador para futuras evoluciones
    
    var clones_creados = 0; // Contador de clones generados
    var radio = 64; // Distancia desde la célula original
    var angulo = 0; // Ángulo inicial para posicionar clones
    
    // Intentamos crear 3 clones en posiciones circulares alrededor
    while (clones_creados < 3) {
        // Calculamos posición en un círculo alrededor de la célula
        var new_x = x + lengthdir_x(radio, angulo);
        var new_y = y + lengthdir_y(radio, angulo);
        
        // Verificamos que no haya colisión con otras células
        if (!place_meeting(new_x, new_y, obj_cell)) {
            var new_cell = instance_create_layer(new_x, new_y, "Instances", obj_cell);
            
            // Aseguramos que sea una célula no evolucionada
            new_cell.sprite_index = spr_cell;
            new_cell.image_xscale = 1;
            new_cell.image_yscale = 1;
            new_cell.click_count = 0; // Resetear contador
            
            clones_creados++; // Incrementamos solo en 1
        }
        
        angulo += 120; // Repartimos 3 clones en 360° (120° cada uno)
    }
}