# approximate_multiplier_4x4
In this we are going to go through some prerequisites to understand how approximate adders work and how can these be implemented into approximate multipliers.

# exact_multiplier
This project assumes that you have basic knowledge of Digital Logic design regarding logic gates and bits. If not you can follow the link to know about em
https://r.mtdv.me/watch?v=JNJfJvkCUF

## Half Adder:
- **Sum** = A ⊕ B
- **Carry** = A ⋅ B

| A | B | Sum | Carry |
|---|---|-----|-------|
| 0 | 0 | 0   | 0     |
| 0 | 1 | 1   | 0     |
| 1 | 0 | 1   | 0     |
| 1 | 1 | 0   | 1     |

## Full Adder:
- **Sum** = A ⊕ B ⊕ Cin
- **Carry** = (A ⋅ B) + (B ⋅ Cin) + (Cin ⋅ A)

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 |  0  |  0  |  0   |
| 0 | 0 |  1  |  1  |  0   |
| 0 | 1 |  0  |  1  |  0   |
| 0 | 1 |  1  |  0  |  1   |
| 1 | 0 |  0  |  1  |  0   |
| 1 | 0 |  1  |  0  |  1   |
| 1 | 1 |  0  |  0  |  1   |
| 1 | 1 |  1  |  1  |  1   |

## Compressor:

An **compressor** is a combinational circuit that compresses multiple binary inputs into fewer outputs while preserving their arithmetic sum. This is commonly used
in digital circuits for applications such as arithmetic operations.

---
### Here's how it's done
If we need to find compressor for **n-input** bits. First we need to know no. of bits required to represent the output (yes it is the sum) and may also contain 
carry bits denpending upon width of the output:

<code style="color : name_color">No. of Bits = ⌈ log₂(n + 1) ⌉</code>

#### **Design Using Full Adders and Half Adders:**

1. **Group Bits:**  
   - Combine three bits at a time using a **Full Adder (FA)**.
   - Continue combining the carry and sum outputs until the minimal number of output bits is achieved.

2. **Use Half Adders (HA) or More Full Adders:**  
   - Add any remaining bits from partial sums and carry bits.

---

Example: 4:2 Compressor (4 Inputs, 2 Outputs)

| **Inputs (a,b,c,d)** | **Sum Output** | **Carry Output** |
|----------------------|----------------|------------------|
| 0000                 | 0              | 0                |
| 0001                 | 1              | 0                |
| 0011                 | 2              | 0                |
| 1111                 | 0              | 2                |

### **Circuit Design for 4:2 Compressor**
- **Step 1:** Use a **full adder (FA)** to combine `a`, `b`, and `c`.
- **Step 2:** Use a second **full adder (FA)** to take the sum from the first and `d`.

---




