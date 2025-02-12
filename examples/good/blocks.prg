# shadowing and static binding

main [string s = "beginning"] {
    println s;
    [string s] {
        s = "first block";
        println "  ", s;
        [string s = "second block"] {
            print "    ", s, "\n";
        }
        println "  after second block == ", s;


    }
    print "after first block == ";
    println s;
}
