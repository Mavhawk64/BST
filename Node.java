public class Node <T extends Comparable<? super T>> {
    private Node<T> parent;
    private Node<T> left;
    private Node<T> right;
    private T value;
    
    public Node(T value) {
        this.value = value;
    }

    public int compareTo(Node<T> node) {
        return this.value.compareTo(node.value);
    }

    public int compareTo(T value) {
        return this.value.compareTo(value);
    }

    public boolean hasNext() {
        return this.right != null || this.left != null;
    }

    // Getters and Setters

    public Node<T> getParent() {
        return this.parent;
    }

    public void setParent(Node<T> parent) {
        this.parent = parent;
    }

    public Node<T> getLeft() {
        return this.left;
    }

    public void setLeft(Node<T> left) {
        this.left = left;
    }

    public Node<T> getRight() {
        return this.right;
    }

    public void setRight(Node<T> right) {
        this.right = right;
    }

    public T getValue() {
        return value;
    }

    public void setValue(T value) {
        this.value = value;
    }

    public void insert(T value2) {
        if (this.compareTo(value2) > 0) {
            if (this.left == null) {
                this.left = new Node<T>(value2);
                this.left.setParent(this);
            } else {
                this.left.insert(value2);
            }
        } else {
            if (this.right == null) {
                this.right = new Node<T>(value2);
                this.right.setParent(this);
            } else {
                this.right.insert(value2);
            }
        }
    }

    public Node<T> searchNode(T value2) {
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

    public void delete(T value2) {
        Node<T> node = this.searchNode(value2);
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
                Node<T> successor = node.getRight();
                while (successor.getLeft() != null) {
                    successor = successor.getLeft();
                }
                node.setValue(successor.getValue());
                successor.delete(successor.getValue());
            }
        }
    }

    public void deleteNodeAndChildren(T value2) {
        Node<T> node = this.searchNode(value2);
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
}
