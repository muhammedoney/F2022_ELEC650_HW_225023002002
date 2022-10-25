module FA (
	input wire A,B,C,
	output wire S,Co
);
  
  wire 	S_ha_1,	
  		Co_ha_1,
  		Co_ha_2;
  
  assign Co = Co_ha_1 | Co_ha_2;
  
  HA ha_1 (
    .A		(A),
    .B		(B),
    .S		(S_ha_1),
    .Co		(Co_ha_1)
  );
  HA ha_2 (
    .A		(S_ha_1),
    .B		(C),
    .S		(S),
    .Co		(Co_ha_2)
  );

endmodule