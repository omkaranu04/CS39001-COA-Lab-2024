module fulladder(a, b, c0, s, c);
	input a, b, c0;
   output s, c;
   wire t1, t2, t3;
   xor x1(t1, a, b);
   xor x2(s, c0, t1);
   and a1(t2, a, b);
   and a2(t3, t1, c0);
   or r1(c, t2, t3);
endmodule