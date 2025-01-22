# Final Project ECE 128

Calculator that supports addition, subtraction, multiplication, negation, and, or, xor operations between two 4 bit numbers on a Basys 3 Artix-7 FPGA board.
All source code is attached including the constraints file to program the FPGA board.

The operation to choose is decided using an 8-to-1 multiplexer and since the results are always calculated, we just assign the result in the top level module. The hardest part of this project was synchronizing the timing on the 7 segment display to show numbers properly, and get rid of artifacts that would crop up if the timing was off in the multisegment driver and the binary to bcd converter.

Overall, it was successful, and we were able to perform these operations on any 2, 4 bit numbers, and a short demo video is below.
https://drive.google.com/file/d/1VR0_GCiff-8k7fpuD9gD0TGH0hufjc6-/view?usp=sharing

![image](https://github.com/user-attachments/assets/52881c2c-c717-4b3f-90fe-7f62107be450)

