package src;

/**
 * Created by deeper on 2015-02-19.
 */
public class Vector {
    private double values[];

    public Vector(int size) {
        this.values = new double[size];
    }

    public Vector(double[] values) {
        this.values = values;
    }

    public void normalize() {
        double n = norm();

        for(int i = 0; i < values.length; ++i) {
            values[i] /= n;
        }
    }

    public void divide(double d) {
        for(int i = 0; i < values.length; ++i) {
            values[i] /= d;
        }
    }

    public double norm() {
        double n = 0;
        for(double v : values) {
            n += v*v;
        }
        return Math.sqrt(n);
    }

    public void set(int idx, double value) {
        values[idx] = value;
    }

    public double cosineSimilarity(Vector v) {
        if(values.length != v.values.length) {
            return 0;
        }

        double d = 0;
        for(int i = 0; i < values.length; ++i) {
            d += values[i] * v.values[i];
        }

        return d;
    }

    public static Vector ones(int size) {
        double[] values = new double[size];
        for(int i = 0; i < size; ++i) {
            values[i] = 1;
        }
        return new Vector(values);
    }
}
