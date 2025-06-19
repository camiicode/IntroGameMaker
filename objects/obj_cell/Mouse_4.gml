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
    click_count = 0; // Reinicia el contador
    
    var clones_creados = 0;
    var radio = sprite_width + 10; // Distancia mínima entre células (ajústala)
    var angulo = 0;
    var intentos_maximos = 20; // Evita loops infinitos
    var intentos = 0;
    
    while (clones_creados < 3 && intentos < intentos_maximos) {
        var new_x = x + lengthdir_x(radio, angulo);
        var new_y = y + lengthdir_y(radio, angulo);
        
        // Chequea colisión con cualquier célula (evolucionada o no)
        if (!instance_position(new_x, new_y, obj_cell)) {
            var new_cell = instance_create_layer(new_x, new_y, "Instances", obj_cell);
            
            // Resetear propiedades
            new_cell.sprite_index = spr_cell;
            new_cell.image_xscale = 1;
            new_cell.image_yscale = 1;
            new_cell.click_count = 0;
            
            clones_creados++;
        }
        
        angulo += random_range(90, 150); // Ángulo aleatorio para distribución orgánica
        intentos++;
    }
}