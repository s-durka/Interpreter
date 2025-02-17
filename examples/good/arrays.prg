# nested functions with static binding;
# arrays passed by reference;
#   - the function changes the values inside the array,
#   - then in "main" it prints it again

int print_arr(int arr[], int n) [int i] {
    i = 0;
    while (i < n) {
        print arr[i];
        i = i+1;
        if (i < n) {
            print ",";
        }
    }
    println "";
    return 0;
}

int modify_array(int arr[], int n) [int i = 0] {
    print "array before: ";
    print_arr(arr, n);
    while (i < n) {
        arr[i] = i;
        i = i +1;
    }
    print "array after: ";
    print_arr(arr, n);
    return 0;
}

main [int n = 10] {
    [int arr[n]] {
        modify_array(arr, n);
        print "array after modify_array(): ";
        print_arr(arr, n);
    }
}