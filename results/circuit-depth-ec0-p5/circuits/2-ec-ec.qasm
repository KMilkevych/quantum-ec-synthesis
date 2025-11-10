OPENQASM 3.0;
include "stdgates.inc";
bit[1] c_dat;
bit[2] c_anc_;
bit[2] c_anc;
qubit[3] q_log0;
qubit[3] q_log1;
qubit[3] q_log2;
qubit[3] q_log3;
qubit[3] q_log4;
qubit[2] q_anc;
cx q_log0[0], q_log0[1];
cx q_log0[0], q_log0[2];
cx q_log1[0], q_log1[1];
cx q_log1[0], q_log1[2];
cx q_log2[0], q_log2[1];
cx q_log2[0], q_log2[2];
cx q_log3[0], q_log3[1];
cx q_log3[0], q_log3[2];
cx q_log4[0], q_log4[1];
cx q_log4[0], q_log4[2];
cx q_log0[0], q_log1[0];
cx q_log0[1], q_log1[1];
cx q_log0[2], q_log1[2];
cx q_log0[0], q_anc[0];
cx q_log0[1], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[2];
}
if (c_anc == 3) {
  x q_log0[1];
}
reset q_anc[0];
reset q_anc[1];
cx q_log1[0], q_anc[0];
cx q_log1[1], q_anc[0];
cx q_log1[1], q_anc[1];
cx q_log1[2], q_anc[1];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
if (c_anc == 1) {
  x q_log1[0];
}
if (c_anc == 2) {
  x q_log1[2];
}
if (c_anc == 3) {
  x q_log1[1];
}
reset q_anc[0];
reset q_anc[1];
cx q_log0[0], q_log2[0];
cx q_log0[1], q_log2[1];
cx q_log0[2], q_log2[2];
x q_log0[0];
x q_log0[1];
x q_log0[2];
x q_log1[0];
x q_log1[1];
x q_log1[2];
x q_log2[0];
x q_log2[1];
x q_log2[2];
x q_log0[0];
x q_log0[1];
x q_log0[2];
x q_log1[0];
x q_log1[1];
x q_log1[2];
x q_log2[0];
x q_log2[1];
x q_log2[2];
cx q_log0[0], q_log3[0];
cx q_log0[1], q_log3[1];
cx q_log0[2], q_log3[2];
cx q_log1[0], q_log3[0];
cx q_log1[1], q_log3[1];
cx q_log1[2], q_log3[2];
cx q_log1[0], q_log4[0];
cx q_log1[1], q_log4[1];
cx q_log1[2], q_log4[2];
cx q_log2[0], q_log4[0];
cx q_log2[1], q_log4[1];
cx q_log2[2], q_log4[2];
cx q_log2[0], q_anc[0];
cx q_log2[1], q_anc[0];
cx q_log2[1], q_anc[1];
cx q_log2[2], q_anc[1];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
if (c_anc == 1) {
  x q_log2[0];
}
if (c_anc == 2) {
  x q_log2[2];
}
if (c_anc == 3) {
  x q_log2[1];
}
reset q_anc[0];
reset q_anc[1];
cx q_log4[0], q_anc[0];
cx q_log4[1], q_anc[0];
cx q_log4[1], q_anc[1];
cx q_log4[2], q_anc[1];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
if (c_anc == 1) {
  x q_log4[0];
}
if (c_anc == 2) {
  x q_log4[2];
}
if (c_anc == 3) {
  x q_log4[1];
}
reset q_anc[0];
reset q_anc[1];
cx q_log3[0], q_anc[0];
cx q_log3[1], q_anc[0];
cx q_log3[1], q_anc[1];
cx q_log3[2], q_anc[1];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
if (c_anc == 1) {
  x q_log3[0];
}
if (c_anc == 2) {
  x q_log3[2];
}
if (c_anc == 3) {
  x q_log3[1];
}
reset q_anc[0];
reset q_anc[1];
cx q_log3[0], q_log3[2];
cx q_log3[0], q_log3[1];
c_anc_[0] = measure q_log3[0];
cx q_log4[0], q_anc[0];
cx q_log4[1], q_anc[0];
cx q_log4[1], q_anc[1];
cx q_log4[2], q_anc[1];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
if (c_anc == 1) {
  x q_log4[0];
}
if (c_anc == 2) {
  x q_log4[2];
}
if (c_anc == 3) {
  x q_log4[1];
}
reset q_anc[0];
reset q_anc[1];
cx q_log4[0], q_log4[2];
cx q_log4[0], q_log4[1];
c_anc_[1] = measure q_log4[0];
if (c_anc_ == 1) {
  x q_log0[0];
  x q_log0[1];
  x q_log0[2];
  cx q_log0[0], q_anc[0];
  cx q_log0[1], q_anc[0];
  cx q_log0[1], q_anc[1];
  cx q_log0[2], q_anc[1];
  c_anc[0] = measure q_anc[0];
  c_anc[1] = measure q_anc[1];
  if (c_anc == 1) {
    x q_log0[0];
  }
  if (c_anc == 2) {
    x q_log0[2];
  }
  if (c_anc == 3) {
    x q_log0[1];
  }
  reset q_anc[0];
  reset q_anc[1];
}
if (c_anc_ == 2) {
  x q_log2[0];
  x q_log2[1];
  x q_log2[2];
  cx q_log2[0], q_anc[0];
  cx q_log2[1], q_anc[0];
  cx q_log2[1], q_anc[1];
  cx q_log2[2], q_anc[1];
  c_anc[0] = measure q_anc[0];
  c_anc[1] = measure q_anc[1];
  if (c_anc == 1) {
    x q_log2[0];
  }
  if (c_anc == 2) {
    x q_log2[2];
  }
  if (c_anc == 3) {
    x q_log2[1];
  }
  reset q_anc[0];
  reset q_anc[1];
}
if (c_anc_ == 3) {
  x q_log1[0];
  x q_log1[1];
  x q_log1[2];
  cx q_log1[0], q_anc[0];
  cx q_log1[1], q_anc[0];
  cx q_log1[1], q_anc[1];
  cx q_log1[2], q_anc[1];
  c_anc[0] = measure q_anc[0];
  c_anc[1] = measure q_anc[1];
  if (c_anc == 1) {
    x q_log1[0];
  }
  if (c_anc == 2) {
    x q_log1[2];
  }
  if (c_anc == 3) {
    x q_log1[1];
  }
  reset q_anc[0];
  reset q_anc[1];
}
reset q_log3[0];
reset q_log3[1];
reset q_log3[2];
cx q_log3[0], q_log3[1];
cx q_log3[0], q_log3[2];
reset q_log4[0];
reset q_log4[1];
reset q_log4[2];
cx q_log4[0], q_log4[1];
cx q_log4[0], q_log4[2];
cx q_log0[0], q_log2[0];
cx q_log0[1], q_log2[1];
cx q_log0[2], q_log2[2];
cx q_log0[0], q_log1[0];
cx q_log0[1], q_log1[1];
cx q_log0[2], q_log1[2];
cx q_log0[0], q_anc[0];
cx q_log0[1], q_anc[0];
cx q_log0[1], q_anc[1];
cx q_log0[2], q_anc[1];
c_anc[0] = measure q_anc[0];
c_anc[1] = measure q_anc[1];
if (c_anc == 1) {
  x q_log0[0];
}
if (c_anc == 2) {
  x q_log0[2];
}
if (c_anc == 3) {
  x q_log0[1];
}
reset q_anc[0];
reset q_anc[1];
cx q_log0[0], q_log0[2];
cx q_log0[0], q_log0[1];
c_dat[0] = measure q_log0[0];
