image_alpha -= 0.02; // Se desvanece poco a poco
hspeed = random_range(-0.5, 0.5)

if (image_alpha <= 0) {
    instance_destroy(); // Se destruye cuando ya es invisible
}
