public class Tree <T extends Comparable<? super T>> {
    private Node<T> root;

    public Tree() {
        this.root = null;
    }

    public void insert(T value) {
        if (this.root == null) {
            this.root = new Node<T>(value);
        } else {
            this.root.insert(value);
        }
    }

    public void delete(T value) {
        if (this.root != null) {
            this.root.delete(value);
        }
    }

    public void deleteNodeAndChildren(T value) {
        if (this.root != null) {
            this.root.deleteNodeAndChildren(value);
        }
    }

    public Node<T> searchNode(T value) {
        if (this.root == null) {
            return null;
        } else {
            return this.root.searchNode(value);
        }
    }

    public Node<T> getRoot() {
        return this.root;
    }

    public void setRoot(Node<T> root) {
        this.root = root;
    }

}
