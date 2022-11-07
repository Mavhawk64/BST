public class Node {
    private Node parent;
    private Node left;
    private Node right;
    private int value;
    public float x_loc;
    public float y_loc;
    
    public Node(int value) {
        this.value = value;
    }

    public int compareTo(Node node) {
        if (this.value < node.value) {
            return -1;
        } else if (this.value > node.value) {
            return 1;
        } else {
            return 0;
        }
        // return this.value.compareTo(node.value);
    }

    public int compareTo(int value) {
        if (this.value < value) {
            return -1;
        } else if (this.value > value) {
            return 1;
        } else {
            return 0;
        }
        // return this.value.compareTo(value);
    }

    public boolean hasNext() {
        return this.right != null || this.left != null;
    }

    public void insert(int value2) {
        if (this.compareTo(value2) > 0) {
            if (this.left == null) {
                this.left = new Node(value2);
                this.left.setParent(this);
            } else {
                this.left.insert(value2);
            }
        } else {
            if (this.right == null) {
                this.right = new Node(value2);
                this.right.setParent(this);
            } else {
                this.right.insert(value2);
            }
        }
    }

    public Node searchNode(int value2) {
        if (this.compareTo(value2) == 0) {
            return this;
        } else if (this.compareTo(value2) > 0) {
            if (this.left == null) {
                return null;
            } else {
                return this.left.searchNode(value2);
            }
        } else {
            if (this.right == null) {
                return null;
            } else {
                return this.right.searchNode(value2);
            }
        }
    }

    public void delete(int value2) {
        Node node = this.searchNode(value2);
        if (node != null) {
            if (node.getLeft() == null && node.getRight() == null) {
                if (node.getParent().getLeft() == node) {
                    node.getParent().setLeft(null);
                } else {
                    node.getParent().setRight(null);
                }
            } else if (node.getLeft() == null) {
                if (node.getParent().getLeft() == node) {
                    node.getParent().setLeft(node.getRight());
                } else {
                    node.getParent().setRight(node.getRight());
                }
            } else if (node.getRight() == null) {
                if (node.getParent().getLeft() == node) {
                    node.getParent().setLeft(node.getLeft());
                } else {
                    node.getParent().setRight(node.getLeft());
                }
            } else {
                Node successor = node.getRight();
                while (successor.getLeft() != null) {
                    successor = successor.getLeft();
                }
                node.setValue(successor.getValue());
                successor.delete(successor.getValue());
            }
        }
    }

    public void deleteNodeAndChildren(int value2) {
        Node node = this.searchNode(value2);
        if (node != null) {
            if (node.getLeft() != null) {
                node.getLeft().deleteNodeAndChildren(node.getLeft().getValue());
            }
            if (node.getRight() != null) {
                node.getRight().deleteNodeAndChildren(node.getRight().getValue());
            }
            node.delete(node.getValue());
        }
    }

    public void show(float xmin, float xmax, int depth, float radius) {
        int node_depth = this.getDepth();
        float x = (xmax + xmin) / 2;
        // Determine the y coordinate by using the total depth and the node's depth as a percentage of the height.
        float y = (float) height * ((float) (node_depth - 0.5) / (float) depth);

        // Set the x_loc and y_loc variables
        this.x_loc = x;
        this.y_loc = y;

        // println("Node: " + this.value + " x: " + x + " y: " + y);

        // if the node has a parent, then draw a line from this node to the parent-node's location
        if (this.parent != null) {
            line(this.x_loc, this.y_loc - radius, this.parent.x_loc, this.parent.y_loc + radius);
        }

        // Draw the node as a circle
        push();
        noStroke();
        circle(x, y, radius*2);
        pop();
        // Label the node with the value
        push();
        textAlign(CENTER);
        fill(0);
        text(this.getValue(), x, y);
        pop();
        // Draw the next level of nodes
        if (this.getLeft() != null) {
            this.getLeft().show(xmin, x, depth, radius);
        }
        if (this.getRight() != null) {
            this.getRight().show(x, xmax, depth, radius);
        }
    }

    public int getDepth() {
        if (this.parent == null) {
            return 1;
        } else {
            return this.parent.getDepth() + 1;
        }
    }

    public int getHeight() {
        return Math.max(this.left == null ? 0 : this.left.getHeight(), this.right == null ? 0 : this.right.getHeight()) + 1;
    }

    // Getters and Setters

    public Node getParent() {
        return this.parent;
    }

    public void setParent(Node parent) {
        this.parent = parent;
    }

    public Node getLeft() {
        return this.left;
    }

    public void setLeft(Node left) {
        this.left = left;
    }

    public Node getRight() {
        return this.right;
    }

    public void setRight(Node right) {
        this.right = right;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
