# Approximate_Multiplier_4-4
In this we are going to go through some prerequisites to understand how approximate adders work and how can these be implemented into approximate multipliers.

# Full and Half Adders in Digital Logic

This repository explains the concepts of Half Adders and Full Adders in digital logic along with their Python implementations. These are fundamental components in digital electronics used for binary addition.

---

## What is a Half Adder?
A **Half Adder** is a combinational circuit that performs the addition of two single-bit binary numbers. It produces two outputs:
- **Sum**: The result of the binary addition.
- **Carry**: The carry generated from the addition.

### Logic Table for Half Adder:
| Input A | Input B | Sum | Carry |
|---------|---------|-----|-------|
|    0    |    0    |  0  |   0   |
|    0    |    1    |  1  |   0   |
|    1    |    0    |  1  |   0   |
|    1    |    1    |  0  |   1   |

---

## What is a Full Adder?
A **Full Adder** extends the Half Adder by including a third input called the **Carry In**. This allows it to add three single-bit binary numbers and produce two outputs:
- **Sum**: The result of the addition.
- **Carry Out**: The carry generated from the addition.

### Logic Table for Full Adder:
| Input A | Input B | Carry In | Sum | Carry Out |
|---------|---------|----------|-----|-----------|
|    0    |    0    |     0    |  0  |     0     |
|    0    |    0    |     1    |  1  |     0     |
|    0    |    1    |     0    |  1  |     0     |
|    0    |    1    |     1    |  0  |     1     |
|    1    |    0    |     0    |  1  |     0     |
|    1    |    0    |     1    |  0  |     1     |
|    1    |    1    |     0    |  0  |     1     |
|    1    |    1    |     1    |  1  |     1     |

