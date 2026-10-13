## CESE - Circuitos Lógicos Programables - TP Final

ALU combinacional 4 bits (ADD / SUB / MUL / SHL) en VHDL.

### Placa remota (VIO)

- Top de implementación: **`alu_vio`**
- Constraints: `ArtyZ7_10_alu_vio.xdc`

Tras abrir el proyecto en Vivado: **Generate Output Products** en el IP `vio` (10 bits out, 6 bits in), luego **Run Synthesis → Run Implementation → Generate Bitstream**.

Simulación: testbenches `*_tb.vhd` en la raíz del proyecto. Top de sim por defecto: **`alu_tb`**. Implementación en placa: top **`alu_vio`** + VIO.

