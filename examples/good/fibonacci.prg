int fibo(int n) [int x; int y] {
    if (n == 0 || n == 1) {
        return 1;
    }
    return fibo(n-1) + fibo(n-2);
}

main [int i; int x; bool stop = false; 
      string str = "test"] {
    print str;
    i = 0;
    while (i < 20 && (!stop)) {
        x = fibo(i);
        if (x > 100) {
            stop = true;
        } else {
            println "fibo(", i, ") = ", x;
            i = i+1;
        }
    }
    print "end of loop; i = ", i;
}