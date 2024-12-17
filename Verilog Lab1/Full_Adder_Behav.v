module fulladder_beh(a, b, cin, s, cout);
    input a, b, cin;
    output s, cout;
    wire t1, t2, t3;
    assign t1 = a ^ b;
    assign s = cin ^ t1;
    assign t2 = a & b;
    assign t3 = cin & t1;
    assign cout = t2 | t3;
endmodule