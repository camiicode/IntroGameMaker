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

// Multiplicación celular
if (click_count == 25) {
    click_count = 0; // Reinicia el contador para poder seguir evolucionando

    var clones = 0;
    var grid_size = 32;
    var padding = sprite_width / 2 - 2;

    for (var dx = -grid_size; dx <= grid_size; dx += grid_size) {
        for (var dy = -grid_size; dy <= grid_size; dy += grid_size) {
            if (clones >= 3) break;

            var new_x = x + dx;
            var new_y = y + dy;

            if (!collision_rectangle(new_x - padding, new_y - padding,
                                     new_x + padding, new_y + padding,
                                     obj_cell, false, true)) {
                var new_cell = instance_create_layer(new_x, new_y, "Instances", obj_cell);

                // Asegúrate de que la nueva célula sea rosada
                new_cell.sprite_index = spr_cell;
                new_cell.image_xscale = 1;
                new_cell.image_yscale = 1;

                clones += 3;
            }
        }
    }
}
