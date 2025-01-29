# approximate_multiplier_4-4
In this we are going to go through some prerequisites to understand how approximate adders work and how can these be implemented into approximate multipliers.

# exact multiplier
This project assumes that you have basic knowledge of Digital Logic design regarding logic gates and bits. If not you can follow the link to know about em
https://r.mtdv.me/watch?v=JNJfJvkCUF
## exact half and full adder
Exact Half Adder
- **Sum** = A ⊕ B
- **Carry** = A ⋅ B
| A | B | **Sum** |** Carry** |
|---|---|---------|-----------|
| 0 | 0 | 0       | 0         |
| 0 | 1 | 1       | 0         |
| 1 | 0 | 1       | 0         |
| 1 | 1 | 0       | 1         |
Exact Full Adder
- **Sum** = A ⊕ B ⊕ Cin
- **Carry** = (A ⋅ B) + (B ⋅ Cin) + (Cin ⋅ A)

