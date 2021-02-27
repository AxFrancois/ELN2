COMPONENT AND4n2
    PORT(
         A : IN  std_logic;
		 B : IN  std_logic;
		 C : IN  std_logic;
		 D : IN  std_logic;
         CE_time45min : OUT  std_logic
        );
END COMPONENT;


----------------------------


A AND B AND NOT(C) AND NOT(D) => CE_time45min