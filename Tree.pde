public class Tree {
    private Node root;

    public Tree() {
        this.root = null;
    }

    public void insert(int value) {
        if (this.root == null) {
            this.root = new Node(value);
        } else {
            this.root.insert(value);
        }
    }

    public void delete(int value) {
        if (this.root != null) {
            this.root.delete(value);
        }
    }

    public void deleteNodeAndChildren(int value) {
        if (this.root != null) {
            this.root.deleteNodeAndChildren(value);
        }
    }

    public Node searchNode(int value) {
        if (this.root == null) {
            return null;
        } else {
            return this.root.searchNode(value);
        }
    }

    public void insertRandomNodes(int n) {
        for (int i = 0; i < n; i++) {
            this.insert((int)random(0,n));
        }
    }

    public void show(float radius) {
        // Using the depth of the tree, we can calculate the locations of each of the nodes
        // and draw them accordingly
        println("HERE");
        if (this.root != null) {
            this.root.show(0, width, this.getHeight(), radius);
        }
    }

    public int getHeight() {
        if (this.root == null) {
            return 0;
        }
        return this.root.getHeight();
    }

    public Node getRoot() {
        return this.root;
    }

    public void setRoot(Node root) {
        this.root = root;
    }

}
