if (shake_timer > 0) {
    shake_timer--;
    x += choose(-1, 1); // Mueve 1px a la izquierda o derecha
}