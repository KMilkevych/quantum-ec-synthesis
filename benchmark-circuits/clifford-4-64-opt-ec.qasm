OPENQASM 3.0;
include "stdgates.inc";
bit[4] c_dat;
bit[3] c_anc;
qubit[7] q_log0;
qubit[7] q_log1;
qubit[7] q_log2;
qubit[7] q_log3;
qubit[3] q_anc;
cx q_log0[0], q_log0[1];
cx q_log0[0], q_log0[2];
h q_log0[4];
h q_log0[5];
h q_log0[6];
cx q_log0[6], q_log0[0];
cx q_log0[6], q_log0[1];
cx q_log0[6], q_log0[3];
cx q_log0[5], q_log0[0];
cx q_log0[5], q_log0[2];
cx q_log0[5], q_log0[3];
cx q_log0[4], q_log0[1];
cx q_log0[4], q_log0[2];
cx q_log0[4], q_log0[3];
cx q_log1[0], q_log1[1];
cx q_log1[0], q_log1[2];
h q_log1[4];
h q_log1[5];
h q_log1[6];
cx q_log1[6], q_log1[0];
cx q_log1[6], q_log1[1];
cx q_log1[6], q_log1[3];
cx q_log1[5], q_log1[0];
cx q_log1[5], q_log1[2];
cx q_log1[5], q_log1[3];
cx q_log1[4], q_log1[1];
cx q_log1[4], q_log1[2];
cx q_log1[4], q_log1[3];
cx q_log2[0], q_log2[1];
cx q_log2[0], q_log2[2];
h q_log2[4];
h q_log2[5];
h q_log2[6];
cx q_log2[6], q_log2[0];
cx q_log2[6], q_log2[1];
cx q_log2[6], q_log2[3];
cx q_log2[5], q_log2[0];
cx q_log2[5], q_log2[2];
cx q_log2[5], q_log2[3];
cx q_log2[4], q_log2[1];
cx q_log2[4], q_log2[2];
cx q_log2[4], q_log2[3];
cx q_log3[0], q_log3[1];
cx q_log3[0], q_log3[2];
h q_log3[4];
h q_log3[5];
h q_log3[6];
cx q_log3[6], q_log3[0];
cx q_log3[6], q_log3[1];
cx q_log3[6], q_log3[3];
cx q_log3[5], q_log3[0];
cx q_log3[5], q_log3[2];
cx q_log3[5], q_log3[3];
cx q_log3[4], q_log3[1];
cx q_log3[4], q_log3[2];
cx q_log3[4], q_log3[3];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
z q_log0[0];
z q_log0[1];
z q_log0[2];
z q_log0[3];
z q_log0[4];
z q_log0[5];
z q_log0[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
z q_log1[0];
z q_log1[1];
z q_log1[2];
z q_log1[3];
z q_log1[4];
z q_log1[5];
z q_log1[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log1[0];
}
if (c_anc == 2) {
  x q_log1[1];
}
if (c_anc == 3) {
  x q_log1[2];
}
if (c_anc == 4) {
  x q_log1[3];
}
if (c_anc == 5) {
  x q_log1[4];
}
if (c_anc == 6) {
  x q_log1[5];
}
if (c_anc == 7) {
  x q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log1[0];
}
if (c_anc == 2) {
  z q_log1[1];
}
if (c_anc == 3) {
  z q_log1[2];
}
if (c_anc == 4) {
  z q_log1[3];
}
if (c_anc == 5) {
  z q_log1[4];
}
if (c_anc == 6) {
  z q_log1[5];
}
if (c_anc == 7) {
  z q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
x q_log1[0];
x q_log1[1];
x q_log1[2];
x q_log1[3];
x q_log1[4];
x q_log1[5];
x q_log1[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log1[0];
}
if (c_anc == 2) {
  x q_log1[1];
}
if (c_anc == 3) {
  x q_log1[2];
}
if (c_anc == 4) {
  x q_log1[3];
}
if (c_anc == 5) {
  x q_log1[4];
}
if (c_anc == 6) {
  x q_log1[5];
}
if (c_anc == 7) {
  x q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log1[0];
}
if (c_anc == 2) {
  z q_log1[1];
}
if (c_anc == 3) {
  z q_log1[2];
}
if (c_anc == 4) {
  z q_log1[3];
}
if (c_anc == 5) {
  z q_log1[4];
}
if (c_anc == 6) {
  z q_log1[5];
}
if (c_anc == 7) {
  z q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
s q_log1[0];
s q_log1[1];
s q_log1[2];
s q_log1[3];
s q_log1[4];
s q_log1[5];
s q_log1[6];
z q_log1[0];
z q_log1[1];
z q_log1[2];
z q_log1[3];
z q_log1[4];
z q_log1[5];
z q_log1[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log1[0];
}
if (c_anc == 2) {
  x q_log1[1];
}
if (c_anc == 3) {
  x q_log1[2];
}
if (c_anc == 4) {
  x q_log1[3];
}
if (c_anc == 5) {
  x q_log1[4];
}
if (c_anc == 6) {
  x q_log1[5];
}
if (c_anc == 7) {
  x q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log1[0];
}
if (c_anc == 2) {
  z q_log1[1];
}
if (c_anc == 3) {
  z q_log1[2];
}
if (c_anc == 4) {
  z q_log1[3];
}
if (c_anc == 5) {
  z q_log1[4];
}
if (c_anc == 6) {
  z q_log1[5];
}
if (c_anc == 7) {
  z q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log1[0];
h q_log1[1];
h q_log1[2];
h q_log1[3];
h q_log1[4];
h q_log1[5];
h q_log1[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log1[0];
}
if (c_anc == 2) {
  x q_log1[1];
}
if (c_anc == 3) {
  x q_log1[2];
}
if (c_anc == 4) {
  x q_log1[3];
}
if (c_anc == 5) {
  x q_log1[4];
}
if (c_anc == 6) {
  x q_log1[5];
}
if (c_anc == 7) {
  x q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log1[0];
}
if (c_anc == 2) {
  z q_log1[1];
}
if (c_anc == 3) {
  z q_log1[2];
}
if (c_anc == 4) {
  z q_log1[3];
}
if (c_anc == 5) {
  z q_log1[4];
}
if (c_anc == 6) {
  z q_log1[5];
}
if (c_anc == 7) {
  z q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
x q_log3[0];
x q_log3[1];
x q_log3[2];
x q_log3[3];
x q_log3[4];
x q_log3[5];
x q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
s q_log3[0];
s q_log3[1];
s q_log3[2];
s q_log3[3];
s q_log3[4];
s q_log3[5];
s q_log3[6];
z q_log3[0];
z q_log3[1];
z q_log3[2];
z q_log3[3];
z q_log3[4];
z q_log3[5];
z q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log3[0];
h q_log3[1];
h q_log3[2];
h q_log3[3];
h q_log3[4];
h q_log3[5];
h q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log2[0], q_log3[0];
cx q_log2[1], q_log3[1];
cx q_log2[2], q_log3[2];
cx q_log2[3], q_log3[3];
cx q_log2[4], q_log3[4];
cx q_log2[5], q_log3[5];
cx q_log2[6], q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log2[0], q_anc[0];
cx q_log2[2], q_anc[0];
cx q_log2[4], q_anc[0];
cx q_log2[6], q_anc[0];
cx q_log2[1], q_anc[1];
cx q_log2[2], q_anc[1];
cx q_log2[5], q_anc[1];
cx q_log2[6], q_anc[1];
cx q_log2[3], q_anc[2];
cx q_log2[4], q_anc[2];
cx q_log2[5], q_anc[2];
cx q_log2[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log2[0];
}
if (c_anc == 2) {
  x q_log2[1];
}
if (c_anc == 3) {
  x q_log2[2];
}
if (c_anc == 4) {
  x q_log2[3];
}
if (c_anc == 5) {
  x q_log2[4];
}
if (c_anc == 6) {
  x q_log2[5];
}
if (c_anc == 7) {
  x q_log2[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log2[0], q_anc[0];
cx q_log2[2], q_anc[0];
cx q_log2[4], q_anc[0];
cx q_log2[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log2[1], q_anc[1];
cx q_log2[2], q_anc[1];
cx q_log2[5], q_anc[1];
cx q_log2[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log2[3], q_anc[2];
cx q_log2[4], q_anc[2];
cx q_log2[5], q_anc[2];
cx q_log2[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log2[0];
}
if (c_anc == 2) {
  z q_log2[1];
}
if (c_anc == 3) {
  z q_log2[2];
}
if (c_anc == 4) {
  z q_log2[3];
}
if (c_anc == 5) {
  z q_log2[4];
}
if (c_anc == 6) {
  z q_log2[5];
}
if (c_anc == 7) {
  z q_log2[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log2[0];
h q_log2[1];
h q_log2[2];
h q_log2[3];
h q_log2[4];
h q_log2[5];
h q_log2[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log2[0], q_anc[0];
cx q_log2[2], q_anc[0];
cx q_log2[4], q_anc[0];
cx q_log2[6], q_anc[0];
cx q_log2[1], q_anc[1];
cx q_log2[2], q_anc[1];
cx q_log2[5], q_anc[1];
cx q_log2[6], q_anc[1];
cx q_log2[3], q_anc[2];
cx q_log2[4], q_anc[2];
cx q_log2[5], q_anc[2];
cx q_log2[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log2[0];
}
if (c_anc == 2) {
  x q_log2[1];
}
if (c_anc == 3) {
  x q_log2[2];
}
if (c_anc == 4) {
  x q_log2[3];
}
if (c_anc == 5) {
  x q_log2[4];
}
if (c_anc == 6) {
  x q_log2[5];
}
if (c_anc == 7) {
  x q_log2[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log2[0], q_anc[0];
cx q_log2[2], q_anc[0];
cx q_log2[4], q_anc[0];
cx q_log2[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log2[1], q_anc[1];
cx q_log2[2], q_anc[1];
cx q_log2[5], q_anc[1];
cx q_log2[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log2[3], q_anc[2];
cx q_log2[4], q_anc[2];
cx q_log2[5], q_anc[2];
cx q_log2[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log2[0];
}
if (c_anc == 2) {
  z q_log2[1];
}
if (c_anc == 3) {
  z q_log2[2];
}
if (c_anc == 4) {
  z q_log2[3];
}
if (c_anc == 5) {
  z q_log2[4];
}
if (c_anc == 6) {
  z q_log2[5];
}
if (c_anc == 7) {
  z q_log2[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log3[0];
h q_log3[1];
h q_log3[2];
h q_log3[3];
h q_log3[4];
h q_log3[5];
h q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
s q_log3[0];
s q_log3[1];
s q_log3[2];
s q_log3[3];
s q_log3[4];
s q_log3[5];
s q_log3[6];
z q_log3[0];
z q_log3[1];
z q_log3[2];
z q_log3[3];
z q_log3[4];
z q_log3[5];
z q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_log3[0];
cx q_log0[1], q_log3[1];
cx q_log0[2], q_log3[2];
cx q_log0[3], q_log3[3];
cx q_log0[4], q_log3[4];
cx q_log0[5], q_log3[5];
cx q_log0[6], q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log0[0];
h q_log0[1];
h q_log0[2];
h q_log0[3];
h q_log0[4];
h q_log0[5];
h q_log0[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
s q_log0[0];
s q_log0[1];
s q_log0[2];
s q_log0[3];
s q_log0[4];
s q_log0[5];
s q_log0[6];
z q_log0[0];
z q_log0[1];
z q_log0[2];
z q_log0[3];
z q_log0[4];
z q_log0[5];
z q_log0[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_log1[0];
cx q_log0[1], q_log1[1];
cx q_log0[2], q_log1[2];
cx q_log0[3], q_log1[3];
cx q_log0[4], q_log1[4];
cx q_log0[5], q_log1[5];
cx q_log0[6], q_log1[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log1[0];
}
if (c_anc == 2) {
  x q_log1[1];
}
if (c_anc == 3) {
  x q_log1[2];
}
if (c_anc == 4) {
  x q_log1[3];
}
if (c_anc == 5) {
  x q_log1[4];
}
if (c_anc == 6) {
  x q_log1[5];
}
if (c_anc == 7) {
  x q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log1[0];
}
if (c_anc == 2) {
  z q_log1[1];
}
if (c_anc == 3) {
  z q_log1[2];
}
if (c_anc == 4) {
  z q_log1[3];
}
if (c_anc == 5) {
  z q_log1[4];
}
if (c_anc == 6) {
  z q_log1[5];
}
if (c_anc == 7) {
  z q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log0[0];
h q_log0[1];
h q_log0[2];
h q_log0[3];
h q_log0[4];
h q_log0[5];
h q_log0[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
s q_log0[0];
s q_log0[1];
s q_log0[2];
s q_log0[3];
s q_log0[4];
s q_log0[5];
s q_log0[6];
z q_log0[0];
z q_log0[1];
z q_log0[2];
z q_log0[3];
z q_log0[4];
z q_log0[5];
z q_log0[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_log3[0];
cx q_log0[1], q_log3[1];
cx q_log0[2], q_log3[2];
cx q_log0[3], q_log3[3];
cx q_log0[4], q_log3[4];
cx q_log0[5], q_log3[5];
cx q_log0[6], q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log0[0];
h q_log0[1];
h q_log0[2];
h q_log0[3];
h q_log0[4];
h q_log0[5];
h q_log0[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
s q_log0[0];
s q_log0[1];
s q_log0[2];
s q_log0[3];
s q_log0[4];
s q_log0[5];
s q_log0[6];
z q_log0[0];
z q_log0[1];
z q_log0[2];
z q_log0[3];
z q_log0[4];
z q_log0[5];
z q_log0[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log0[0];
h q_log0[1];
h q_log0[2];
h q_log0[3];
h q_log0[4];
h q_log0[5];
h q_log0[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log1[0];
h q_log1[1];
h q_log1[2];
h q_log1[3];
h q_log1[4];
h q_log1[5];
h q_log1[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log1[0];
}
if (c_anc == 2) {
  x q_log1[1];
}
if (c_anc == 3) {
  x q_log1[2];
}
if (c_anc == 4) {
  x q_log1[3];
}
if (c_anc == 5) {
  x q_log1[4];
}
if (c_anc == 6) {
  x q_log1[5];
}
if (c_anc == 7) {
  x q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log1[0];
}
if (c_anc == 2) {
  z q_log1[1];
}
if (c_anc == 3) {
  z q_log1[2];
}
if (c_anc == 4) {
  z q_log1[3];
}
if (c_anc == 5) {
  z q_log1[4];
}
if (c_anc == 6) {
  z q_log1[5];
}
if (c_anc == 7) {
  z q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
s q_log1[0];
s q_log1[1];
s q_log1[2];
s q_log1[3];
s q_log1[4];
s q_log1[5];
s q_log1[6];
z q_log1[0];
z q_log1[1];
z q_log1[2];
z q_log1[3];
z q_log1[4];
z q_log1[5];
z q_log1[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log1[0];
}
if (c_anc == 2) {
  x q_log1[1];
}
if (c_anc == 3) {
  x q_log1[2];
}
if (c_anc == 4) {
  x q_log1[3];
}
if (c_anc == 5) {
  x q_log1[4];
}
if (c_anc == 6) {
  x q_log1[5];
}
if (c_anc == 7) {
  x q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log1[0];
}
if (c_anc == 2) {
  z q_log1[1];
}
if (c_anc == 3) {
  z q_log1[2];
}
if (c_anc == 4) {
  z q_log1[3];
}
if (c_anc == 5) {
  z q_log1[4];
}
if (c_anc == 6) {
  z q_log1[5];
}
if (c_anc == 7) {
  z q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log3[0];
h q_log3[1];
h q_log3[2];
h q_log3[3];
h q_log3[4];
h q_log3[5];
h q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
s q_log3[0];
s q_log3[1];
s q_log3[2];
s q_log3[3];
s q_log3[4];
s q_log3[5];
s q_log3[6];
z q_log3[0];
z q_log3[1];
z q_log3[2];
z q_log3[3];
z q_log3[4];
z q_log3[5];
z q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
h q_log3[0];
h q_log3[1];
h q_log3[2];
h q_log3[3];
h q_log3[4];
h q_log3[5];
h q_log3[6];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
barrier q_log2[4], q_log1[1], q_log3[4], q_log2[6], q_log3[1], q_log1[0], q_log3[3], q_log0[0], q_log0[1], q_log0[2], q_log0[5], q_log1[2], q_log0[4], q_log1[5], q_log2[3], q_log2[2], q_log0[3], q_log0[6], q_log1[3], q_log1[6], q_log2[5], q_log3[5], q_log3[0], q_log3[6], q_log3[2], q_log1[4], q_log2[1], q_log2[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[1];
}
if (c_anc == 3) {
  x q_log0[2];
}
if (c_anc == 4) {
  x q_log0[3];
}
if (c_anc == 5) {
  x q_log0[4];
}
if (c_anc == 6) {
  x q_log0[5];
}
if (c_anc == 7) {
  x q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log0[0], q_anc[0];
cx q_log0[2], q_anc[0];
cx q_log0[4], q_anc[0];
cx q_log0[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
cx q_log0[5], q_anc[1];
cx q_log0[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log0[3], q_anc[2];
cx q_log0[4], q_anc[2];
cx q_log0[5], q_anc[2];
cx q_log0[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log0[0];
}
if (c_anc == 2) {
  z q_log0[1];
}
if (c_anc == 3) {
  z q_log0[2];
}
if (c_anc == 4) {
  z q_log0[3];
}
if (c_anc == 5) {
  z q_log0[4];
}
if (c_anc == 6) {
  z q_log0[5];
}
if (c_anc == 7) {
  z q_log0[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
cx q_log0[4], q_log0[3];
cx q_log0[4], q_log0[2];
cx q_log0[4], q_log0[1];
cx q_log0[5], q_log0[3];
cx q_log0[5], q_log0[2];
cx q_log0[5], q_log0[0];
cx q_log0[6], q_log0[3];
cx q_log0[6], q_log0[1];
cx q_log0[6], q_log0[0];
h q_log0[6];
h q_log0[5];
h q_log0[4];
cx q_log0[0], q_log0[2];
cx q_log0[0], q_log0[1];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_dat[0] = measure q_log0[0];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log1[0];
}
if (c_anc == 2) {
  x q_log1[1];
}
if (c_anc == 3) {
  x q_log1[2];
}
if (c_anc == 4) {
  x q_log1[3];
}
if (c_anc == 5) {
  x q_log1[4];
}
if (c_anc == 6) {
  x q_log1[5];
}
if (c_anc == 7) {
  x q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log1[0], q_anc[0];
cx q_log1[2], q_anc[0];
cx q_log1[4], q_anc[0];
cx q_log1[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
cx q_log1[5], q_anc[1];
cx q_log1[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log1[3], q_anc[2];
cx q_log1[4], q_anc[2];
cx q_log1[5], q_anc[2];
cx q_log1[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log1[0];
}
if (c_anc == 2) {
  z q_log1[1];
}
if (c_anc == 3) {
  z q_log1[2];
}
if (c_anc == 4) {
  z q_log1[3];
}
if (c_anc == 5) {
  z q_log1[4];
}
if (c_anc == 6) {
  z q_log1[5];
}
if (c_anc == 7) {
  z q_log1[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
cx q_log1[4], q_log1[3];
cx q_log1[4], q_log1[2];
cx q_log1[4], q_log1[1];
cx q_log1[5], q_log1[3];
cx q_log1[5], q_log1[2];
cx q_log1[5], q_log1[0];
cx q_log1[6], q_log1[3];
cx q_log1[6], q_log1[1];
cx q_log1[6], q_log1[0];
h q_log1[6];
h q_log1[5];
h q_log1[4];
cx q_log1[0], q_log1[2];
cx q_log1[0], q_log1[1];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_dat[1] = measure q_log1[0];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log2[0], q_anc[0];
cx q_log2[2], q_anc[0];
cx q_log2[4], q_anc[0];
cx q_log2[6], q_anc[0];
cx q_log2[1], q_anc[1];
cx q_log2[2], q_anc[1];
cx q_log2[5], q_anc[1];
cx q_log2[6], q_anc[1];
cx q_log2[3], q_anc[2];
cx q_log2[4], q_anc[2];
cx q_log2[5], q_anc[2];
cx q_log2[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log2[0];
}
if (c_anc == 2) {
  x q_log2[1];
}
if (c_anc == 3) {
  x q_log2[2];
}
if (c_anc == 4) {
  x q_log2[3];
}
if (c_anc == 5) {
  x q_log2[4];
}
if (c_anc == 6) {
  x q_log2[5];
}
if (c_anc == 7) {
  x q_log2[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log2[0], q_anc[0];
cx q_log2[2], q_anc[0];
cx q_log2[4], q_anc[0];
cx q_log2[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log2[1], q_anc[1];
cx q_log2[2], q_anc[1];
cx q_log2[5], q_anc[1];
cx q_log2[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log2[3], q_anc[2];
cx q_log2[4], q_anc[2];
cx q_log2[5], q_anc[2];
cx q_log2[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log2[0];
}
if (c_anc == 2) {
  z q_log2[1];
}
if (c_anc == 3) {
  z q_log2[2];
}
if (c_anc == 4) {
  z q_log2[3];
}
if (c_anc == 5) {
  z q_log2[4];
}
if (c_anc == 6) {
  z q_log2[5];
}
if (c_anc == 7) {
  z q_log2[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
cx q_log2[4], q_log2[3];
cx q_log2[4], q_log2[2];
cx q_log2[4], q_log2[1];
cx q_log2[5], q_log2[3];
cx q_log2[5], q_log2[2];
cx q_log2[5], q_log2[0];
cx q_log2[6], q_log2[3];
cx q_log2[6], q_log2[1];
cx q_log2[6], q_log2[0];
h q_log2[6];
h q_log2[5];
h q_log2[4];
cx q_log2[0], q_log2[2];
cx q_log2[0], q_log2[1];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_dat[2] = measure q_log2[0];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[1];
}
if (c_anc == 3) {
  x q_log3[2];
}
if (c_anc == 4) {
  x q_log3[3];
}
if (c_anc == 5) {
  x q_log3[4];
}
if (c_anc == 6) {
  x q_log3[5];
}
if (c_anc == 7) {
  x q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
h q_anc[0];
cx q_log3[0], q_anc[0];
cx q_log3[2], q_anc[0];
cx q_log3[4], q_anc[0];
cx q_log3[6], q_anc[0];
h q_anc[0];
h q_anc[1];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
cx q_log3[5], q_anc[1];
cx q_log3[6], q_anc[1];
h q_anc[1];
h q_anc[2];
cx q_log3[3], q_anc[2];
cx q_log3[4], q_anc[2];
cx q_log3[5], q_anc[2];
cx q_log3[6], q_anc[2];
h q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
c_anc[2] = measure q_anc[2];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
if (c_anc == 1) {
  z q_log3[0];
}
if (c_anc == 2) {
  z q_log3[1];
}
if (c_anc == 3) {
  z q_log3[2];
}
if (c_anc == 4) {
  z q_log3[3];
}
if (c_anc == 5) {
  z q_log3[4];
}
if (c_anc == 6) {
  z q_log3[5];
}
if (c_anc == 7) {
  z q_log3[6];
}
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
reset q_anc[0];
reset q_anc[1];
reset q_anc[2];
barrier q_anc[0], q_anc[1], q_anc[2];
cx q_log3[4], q_log3[3];
cx q_log3[4], q_log3[2];
cx q_log3[4], q_log3[1];
cx q_log3[5], q_log3[3];
cx q_log3[5], q_log3[2];
cx q_log3[5], q_log3[0];
cx q_log3[6], q_log3[3];
cx q_log3[6], q_log3[1];
cx q_log3[6], q_log3[0];
h q_log3[6];
h q_log3[5];
h q_log3[4];
cx q_log3[0], q_log3[2];
cx q_log3[0], q_log3[1];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
c_dat[3] = measure q_log3[0];
barrier q_log0[0], q_log0[1], q_log0[2], q_log0[3], q_log0[4], q_log0[5], q_log0[6], q_log1[0], q_log1[1], q_log1[2], q_log1[3], q_log1[4], q_log1[5], q_log1[6], q_log2[0], q_log2[1], q_log2[2], q_log2[3], q_log2[4], q_log2[5], q_log2[6], q_log3[0], q_log3[1], q_log3[2], q_log3[3], q_log3[4], q_log3[5], q_log3[6], q_anc[0], q_anc[1], q_anc[2];
