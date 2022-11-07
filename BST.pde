Tree t;
void setup() {
    size(400, 400);
    t = new Tree();
    t.insertRandomNodes(25);
}

void draw() {
    background(50);
    fill(0,255,255);
    stroke(255);
    t.show(10);
}
