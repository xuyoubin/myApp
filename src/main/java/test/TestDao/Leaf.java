package test.TestDao;

public class Leaf {
    private String color;
    private int name;

    Leaf(String color,int name){
        this.color = color;
        this.name = name;
    }

    public boolean equals(Object o){
        if(o == null){
            return false;
        }else{
            if(o instanceof Leaf){
                Leaf leaf = (Leaf) o;
                if(this.name == leaf.name && this.color==leaf.color){
                    return  true;
                }
            }
        }
        return false;
    }



    public static void main(String[] args){
        Leaf leaf = new Leaf(null,6);
        Leaf leaf1 = new Leaf("red",6);

      System.out.println(leaf.equals(leaf1));
    }
}
