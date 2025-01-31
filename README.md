# approximate_multiplier_4x4
in this we are going to go through some prerequisites to understand how approximate adders work and how can these be implemented into approximate multipliers.

# exact_multiplier
this project assumes that you have basic knowledge of Digital Logic design regarding logic gates and bits. if not you can follow the link to know about em
https://r.mtdv.me/watch?v=JNJfJvkCUF

## half_adder:
- **sum** = a ⊕ b
- **carry** = a ⋅ b

| a | b | sum | carry |
|---|---|-----|-------|
| 0 | 0 | 0   | 0     |
| 0 | 1 | 1   | 0     |
| 1 | 0 | 1   | 0     |
| 1 | 1 | 0   | 1     |

## full_adder:
- **sum** = a ⊕ b ⊕ cin
- **carry** = (a ⋅ b) + (b ⋅ cin) + (cin ⋅ a)

| a | b | cin | sum | cout |
|---|---|-----|-----|------|
| 0 | 0 |  0  |  0  |  0   |
| 0 | 0 |  1  |  1  |  0   |
| 0 | 1 |  0  |  1  |  0   |
| 0 | 1 |  1  |  0  |  1   |
| 1 | 0 |  0  |  1  |  0   |
| 1 | 0 |  1  |  0  |  1   |
| 1 | 1 |  0  |  0  |  1   |
| 1 | 1 |  1  |  1  |  1   |

## compressor:

an **compressor** is a combinational circuit that compresses multiple binary inputs into fewer outputs while preserving their arithmetic sum. this is commonly used in digital circuits for applications such as arithmetic operations.

---
### here's how it's done
if we need to find compressor for **n-input** bits. First we need to know no. of bits required to represent the output (yes it is the sum) and may also contain carry bits denpending upon width of the output:

<code style="color : name_color">No. of Bits = ⌈ log₂(n + 1) ⌉</code>

#### **design using full_adders and half_adders:**

1. **group bits:**  
   - combine three bits at a time using a **full_adder (fa)**.
   - continue combining the carry and sum outputs until the minimal number of output bits is achieved.

2. **use half_adders or more full_adders:**  
   - add any remaining bits from partial sums and carry bits.

---

example: 4:2 compressor (4 inputs, 2 outputs)

| **inputs (a,b,c,d)** | **sum output** | **carry output** |
|----------------------|----------------|------------------|
| 0000                 | 0              | 0                |
| 0001                 | 1              | 0                |
| 0011                 | 0              | 1                |
| 1111                 | 0              | 2                |

### **circuit design for 4:2 compressor**
- **step 1:** Use a **full_adder (fa)** to combine `a`, `b`, and `c`.
- **step 2:** Use a second **full_adder (fa)** to take the sum from the first and `d`.

---




