; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s --check-prefixes=CHECK,CONSTVEC
; RUN: opt < %s -passes=instcombine -S -use-constant-int-for-fixed-length-splat | FileCheck %s --check-prefixes=CHECK,CONSTSPLAT

define i32 @add_select_cmp_and1(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and1(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = select i1 %cmp1, i32 0, i32 144
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_and2(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and2(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 5
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in, 4
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = select i1 %cmp1, i32 0, i32 288
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_and3(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and3(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 7
; CHECK-NEXT:    [[TEMP1:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[TEMP1]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = select i1 %cmp1, i32 0, i32 144
  %temp = or disjoint i32 %sel0, %sel1
  %bitop2 = and i32 %in, 4
  %cmp2 = icmp eq i32 %bitop2, 0
  %sel2 = select i1 %cmp2, i32 0, i32 288
  %out = or disjoint i32 %temp, %sel2
  ret i32 %out
}

define i32 @add_select_cmp_and4(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and4(
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[IN:%.*]], 15
; CHECK-NEXT:    [[TEMP2:%.*]] = mul nuw nsw i32 [[TMP2]], 72
; CHECK-NEXT:    ret i32 [[TEMP2]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = select i1 %cmp1, i32 0, i32 144
  %temp = or disjoint i32 %sel0, %sel1
  %bitop2 = and i32 %in, 4
  %cmp2 = icmp eq i32 %bitop2, 0
  %bitop3 = and i32 %in, 8
  %cmp3 = icmp eq i32 %bitop3, 0
  %sel2 = select i1 %cmp2, i32 0, i32 288
  %sel3 = select i1 %cmp3, i32 0, i32 576
  %temp2 = or disjoint i32 %sel2, %sel3
  %out = or disjoint i32 %temp, %temp2
  ret i32 %out
}

define i32 @add_select_cmp_and_pred1(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and_pred1(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp ne i32 %bitop0, 0
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 72, i32 0
  %sel1 = select i1 %cmp1, i32 0, i32 144
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_and_pred2(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and_pred2(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp ne i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = select i1 %cmp1, i32 144, i32 0
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_and_pred3(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and_pred3(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp ne i32 %bitop0, 0
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp ne i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 72, i32 0
  %sel1 = select i1 %cmp1, i32 144, i32 0
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_trunc(i32 %in) {
; CHECK-LABEL: @add_select_cmp_trunc(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %cmp0 = trunc i32 %in to i1
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 72, i32 0
  %sel1 = select i1 %cmp1, i32 0, i32 144
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_trunc1(i32 %in) {
; CHECK-LABEL: @add_select_cmp_trunc1(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %cmp0 = trunc i32 %in to i1
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp ne i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 72, i32 0
  %sel1 = select i1 %cmp1, i32 144, i32 0
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}


define i32 @add_select_cmp_and_const_mismatch(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and_const_mismatch(
; CHECK-NEXT:    [[BITOP0:%.*]] = and i32 [[IN:%.*]], 1
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq i32 [[BITOP0]], 0
; CHECK-NEXT:    [[BITOP1:%.*]] = and i32 [[IN]], 2
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq i32 [[BITOP1]], 0
; CHECK-NEXT:    [[SEL0:%.*]] = select i1 [[CMP0]], i32 0, i32 72
; CHECK-NEXT:    [[SEL1:%.*]] = select i1 [[CMP1]], i32 0, i32 288
; CHECK-NEXT:    [[OUT:%.*]] = or disjoint i32 [[SEL0]], [[SEL1]]
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = select i1 %cmp1, i32 0, i32 288
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_and_value_mismatch(i32 %in, i32 %in1) {
; CHECK-LABEL: @add_select_cmp_and_value_mismatch(
; CHECK-NEXT:    [[BITOP0:%.*]] = and i32 [[IN:%.*]], 1
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq i32 [[BITOP0]], 0
; CHECK-NEXT:    [[BITOP1:%.*]] = and i32 [[IN1:%.*]], 2
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq i32 [[BITOP1]], 0
; CHECK-NEXT:    [[SEL0:%.*]] = select i1 [[CMP0]], i32 0, i32 72
; CHECK-NEXT:    [[SEL1:%.*]] = select i1 [[CMP1]], i32 0, i32 144
; CHECK-NEXT:    [[OUT:%.*]] = or disjoint i32 [[SEL0]], [[SEL1]]
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in1, 2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = select i1 %cmp1, i32 0, i32 144
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_and_negative(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and_negative(
; CHECK-NEXT:    [[BITOP0:%.*]] = and i32 [[IN:%.*]], 1
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq i32 [[BITOP0]], 0
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ult i32 [[IN]], 2
; CHECK-NEXT:    [[SEL0:%.*]] = select i1 [[CMP0]], i32 0, i32 72
; CHECK-NEXT:    [[SEL1:%.*]] = select i1 [[CMP1]], i32 0, i32 -144
; CHECK-NEXT:    [[OUT:%.*]] = or disjoint i32 [[SEL0]], [[SEL1]]
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in, -2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = select i1 %cmp1, i32 0, i32 -144
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_and_bitsel_overlap(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and_bitsel_overlap(
; CHECK-NEXT:    [[BITOP0:%.*]] = and i32 [[IN:%.*]], 2
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq i32 [[BITOP0]], 0
; CHECK-NEXT:    [[SEL0:%.*]] = select i1 [[CMP0]], i32 0, i32 144
; CHECK-NEXT:    ret i32 [[SEL0]]
;
  %bitop0 = and i32 %in, 2
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 144
  %sel1 = select i1 %cmp1, i32 0, i32 144
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

; We cannot combine into and-mul, as %bitop1 may not be exactly 6

define i32 @add_select_cmp_and_multbit_mask(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and_multbit_mask(
; CHECK-NEXT:    [[BITOP0:%.*]] = and i32 [[IN:%.*]], 1
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq i32 [[BITOP0]], 0
; CHECK-NEXT:    [[BITOP1:%.*]] = and i32 [[IN]], 6
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq i32 [[BITOP1]], 0
; CHECK-NEXT:    [[SEL0:%.*]] = select i1 [[CMP0]], i32 0, i32 72
; CHECK-NEXT:    [[SEL1:%.*]] = select i1 [[CMP1]], i32 0, i32 432
; CHECK-NEXT:    [[OUT:%.*]] = or disjoint i32 [[SEL0]], [[SEL1]]
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %bitop1 = and i32 %in, 6
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = select i1 %cmp1, i32 0, i32 432
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}


define <2 x i32> @add_select_cmp_vec(<2 x i32> %in) {
; CHECK-LABEL: @add_select_cmp_vec(
; CHECK-NEXT:    [[TMP1:%.*]] = and <2 x i32> [[IN:%.*]], splat (i32 3)
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw <2 x i32> [[TMP1]], splat (i32 72)
; CHECK-NEXT:    ret <2 x i32> [[OUT]]
;
  %bitop0 = and <2 x i32> %in, <i32 1, i32 1>
  %cmp0 = icmp eq <2 x i32> %bitop0, <i32 0, i32 0>
  %bitop1 = and <2 x i32> %in, <i32 2, i32 2>
  %cmp1 = icmp eq <2 x i32> %bitop1, <i32 0, i32 0>
  %sel0 = select <2 x i1> %cmp0, <2 x i32> <i32 0, i32 0>, <2 x i32> <i32 72, i32 72>
  %sel1 = select <2 x i1> %cmp1, <2 x i32> <i32 0, i32 0>, <2 x i32> <i32 144, i32 144>
  %out = or disjoint <2 x i32> %sel0, %sel1
  ret <2 x i32> %out
}

define <2 x i32> @add_select_cmp_vec_poison(<2 x i32> %in) {
; CHECK-LABEL: @add_select_cmp_vec_poison(
; CHECK-NEXT:    [[BITOP0:%.*]] = and <2 x i32> [[IN:%.*]], splat (i32 1)
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq <2 x i32> [[BITOP0]], zeroinitializer
; CHECK-NEXT:    [[BITOP1:%.*]] = and <2 x i32> [[IN]], splat (i32 2)
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq <2 x i32> [[BITOP1]], zeroinitializer
; CHECK-NEXT:    [[SEL1:%.*]] = select <2 x i1> [[CMP1]], <2 x i32> zeroinitializer, <2 x i32> <i32 poison, i32 144>
; CHECK-NEXT:    [[OUT:%.*]] = select <2 x i1> [[CMP0]], <2 x i32> [[SEL1]], <2 x i32> <i32 72, i32 poison>
; CHECK-NEXT:    ret <2 x i32> [[OUT]]
;
  %bitop0 = and <2 x i32> %in, <i32 1, i32 1>
  %cmp0 = icmp eq <2 x i32> %bitop0, <i32 0, i32 0>
  %bitop1 = and <2 x i32> %in, <i32 2, i32 2>
  %cmp1 = icmp eq <2 x i32> %bitop1, <i32 0, i32 0>
  %sel0 = select <2 x i1> %cmp0, <2 x i32> <i32 0, i32 0>, <2 x i32> <i32 72, i32 poison>
  %sel1 = select <2 x i1> %cmp1, <2 x i32> <i32 0, i32 0>, <2 x i32> <i32 poison, i32 144>
  %out = or disjoint <2 x i32> %sel0, %sel1
  ret <2 x i32> %out
}

define <2 x i32> @add_select_cmp_vec_nonunique(<2 x i32> %in) {
; CHECK-LABEL: @add_select_cmp_vec_nonunique(
; CHECK-NEXT:    [[BITOP0:%.*]] = and <2 x i32> [[IN:%.*]], <i32 1, i32 2>
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq <2 x i32> [[BITOP0]], zeroinitializer
; CHECK-NEXT:    [[BITOP1:%.*]] = and <2 x i32> [[IN]], <i32 4, i32 8>
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq <2 x i32> [[BITOP1]], zeroinitializer
; CHECK-NEXT:    [[SEL0:%.*]] = select <2 x i1> [[CMP0]], <2 x i32> zeroinitializer, <2 x i32> <i32 72, i32 144>
; CHECK-NEXT:    [[SEL1:%.*]] = select <2 x i1> [[CMP1]], <2 x i32> zeroinitializer, <2 x i32> <i32 288, i32 576>
; CHECK-NEXT:    [[OUT:%.*]] = or disjoint <2 x i32> [[SEL0]], [[SEL1]]
; CHECK-NEXT:    ret <2 x i32> [[OUT]]
;
  %bitop0 = and <2 x i32> %in, <i32 1, i32 2>
  %cmp0 = icmp eq <2 x i32> %bitop0, <i32 0, i32 0>
  %bitop1 = and <2 x i32> %in, <i32 4, i32 8>
  %cmp1 = icmp eq <2 x i32> %bitop1, <i32 0, i32 0>
  %sel0 = select <2 x i1> %cmp0, <2 x i32> <i32 0, i32 0>, <2 x i32> <i32 72, i32 144>
  %sel1 = select <2 x i1> %cmp1, <2 x i32> <i32 0, i32 0>, <2 x i32> <i32 288, i32 576>
  %out = or disjoint <2 x i32> %sel0, %sel1
  ret <2 x i32> %out
}

define i64 @mask_select_types(i32 %in) {
; CHECK-LABEL: @mask_select_types(
; CHECK-NEXT:    [[BITOP0:%.*]] = and i32 [[IN:%.*]], 1
; CHECK-NEXT:    [[CMP0_NOT:%.*]] = icmp eq i32 [[BITOP0]], 0
; CHECK-NEXT:    [[BITOP1:%.*]] = and i32 [[IN]], 2
; CHECK-NEXT:    [[CMP1_NOT:%.*]] = icmp eq i32 [[BITOP1]], 0
; CHECK-NEXT:    [[SEL0:%.*]] = select i1 [[CMP0_NOT]], i64 0, i64 72
; CHECK-NEXT:    [[SEL1:%.*]] = select i1 [[CMP1_NOT]], i64 0, i64 144
; CHECK-NEXT:    [[OUT:%.*]] = or disjoint i64 [[SEL0]], [[SEL1]]
; CHECK-NEXT:    ret i64 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp ne i32 %bitop0, 0
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp ne i32 %bitop1, 0
  %sel0 = select i1 %cmp0, i64 72, i64 0
  %sel1 = select i1 %cmp1, i64 144, i64 0
  %out = or disjoint i64 %sel0, %sel1
  ret i64 %out
}

define i64 @mask_select_types_1(i64 %in) {
; CHECK-LABEL: @mask_select_types_1(
; CHECK-NEXT:    [[TMP1:%.*]] = and i64 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i64 [[TMP1]], 72
; CHECK-NEXT:    ret i64 [[OUT]]
;
  %bitop0 = and i64 %in, 1
  %cmp0 = icmp ne i64 %bitop0, 0
  %bitop1 = and i64 %in, 2
  %cmp1 = icmp ne i64 %bitop1, 0
  %sel0 = select i1 %cmp0, i64 72, i64 0
  %sel1 = select i1 %cmp1, i64 144, i64 0
  %out = or disjoint i64 %sel0, %sel1
  ret i64 %out
}

define i32 @add_select_cmp_mixed1(i32 %in) {
; CHECK-LABEL: @add_select_cmp_mixed1(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %mask = and i32 %in, 1
  %sel0 = mul i32 %mask, 72
  %bitop1 = and i32 %in, 2
  %cmp1 = icmp eq i32 %bitop1, 0
  %sel1 = select i1 %cmp1, i32 0, i32 144
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_mixed2(i32 %in) {
; CHECK-LABEL: @add_select_cmp_mixed2(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %mask = and i32 %in, 2
  %sel0 = select i1 %cmp0, i32 0, i32 72
  %sel1 = mul i32 %mask, 72
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_and_mul(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and_mul(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 3
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %mask0 = and i32 %in, 1
  %sel0 = mul i32 %mask0, 72
  %mask1 = and i32 %in, 2
  %sel1 = mul i32 %mask1, 72
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_mixed2_mismatch(i32 %in) {
; CHECK-LABEL: @add_select_cmp_mixed2_mismatch(
; CHECK-NEXT:    [[BITOP0:%.*]] = and i32 [[IN:%.*]], 1
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq i32 [[BITOP0]], 0
; CHECK-NEXT:    [[MASK:%.*]] = and i32 [[IN]], 2
; CHECK-NEXT:    [[SEL0:%.*]] = select i1 [[CMP0]], i32 0, i32 73
; CHECK-NEXT:    [[SEL1:%.*]] = mul nuw nsw i32 [[MASK]], 72
; CHECK-NEXT:    [[OUT:%.*]] = or disjoint i32 [[SEL0]], [[SEL1]]
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %bitop0 = and i32 %in, 1
  %cmp0 = icmp eq i32 %bitop0, 0
  %mask = and i32 %in, 2
  %sel0 = select i1 %cmp0, i32 0, i32 73
  %sel1 = mul i32 %mask, 72
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @add_select_cmp_and_mul_mismatch(i32 %in) {
; CHECK-LABEL: @add_select_cmp_and_mul_mismatch(
; CHECK-NEXT:    [[TMP1:%.*]] = trunc i32 [[IN:%.*]] to i1
; CHECK-NEXT:    [[SEL0:%.*]] = select i1 [[TMP1]], i32 73, i32 0
; CHECK-NEXT:    [[MASK1:%.*]] = and i32 [[IN]], 2
; CHECK-NEXT:    [[SEL1:%.*]] = mul nuw nsw i32 [[MASK1]], 72
; CHECK-NEXT:    [[OUT:%.*]] = or disjoint i32 [[SEL0]], [[SEL1]]
; CHECK-NEXT:    ret i32 [[OUT]]
;
  %mask0 = and i32 %in, 1
  %sel0 = mul i32 %mask0, 73
  %mask1 = and i32 %in, 2
  %sel1 = mul i32 %mask1, 72
  %out = or disjoint i32 %sel0, %sel1
  ret i32 %out
}

define i32 @and_mul_non_disjoint(i32 %in) {
; CHECK-LABEL: @and_mul_non_disjoint(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[IN:%.*]], 2
; CHECK-NEXT:    [[OUT:%.*]] = mul nuw nsw i32 [[TMP1]], 72
; CHECK-NEXT:    [[MASK1:%.*]] = and i32 [[IN]], 4
; CHECK-NEXT:    [[SEL1:%.*]] = mul nuw nsw i32 [[MASK1]], 72
; CHECK-NEXT:    [[OUT1:%.*]] = or i32 [[OUT]], [[SEL1]]
; CHECK-NEXT:    ret i32 [[OUT1]]
;
  %mask0 = and i32 %in, 2
  %sel0 = mul i32 %mask0, 72
  %mask1 = and i32 %in, 4
  %sel1 = mul i32 %mask1, 72
  %out = or i32 %sel0, %sel1
  ret i32 %out
}

;; NOTE: These prefixes are unused and the list is autogenerated. Do not add tests below this line:
; CONSTSPLAT: {{.*}}
; CONSTVEC: {{.*}}
