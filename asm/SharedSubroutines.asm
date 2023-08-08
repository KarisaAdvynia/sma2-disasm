swi_MemoryCopy32:
swi   0xC                           ; 0809DFBC
bx    lr                            ; 0809DFBE

swi_MemoryCopy4or2:
swi   0xB                           ; 0809DFC0
bx    lr                            ; 0809DFC2

swi_Divide:
swi   0x6                           ; 0809DFC4
bx    lr                            ; 0809DFC6

swi_Remainder:
swi   0x6                           ; 0809DFC8
mov   r0,r1                         ; 0809DFCA
bx    lr                            ; 0809DFCC
.pool                               ; 0809DFCE

swi_Huffman:
swi   0x13                          ; 0809DFD0
bx    lr                            ; 0809DFD2

swi_LZ77_VRAM:
swi   0x12                          ; 0809DFD4
bx    lr                            ; 0809DFD6

swi_25_1:
mov   r1,0x1                        ; 0809DFD8
swi   0x25                          ; 0809DFDA
bx    lr                            ; 0809DFDC
.pool                               ; 0809DFDE

swi_0F:
swi   0xF                           ; 0809DFE0
bx    lr                            ; 0809DFE2

swi_01:
swi   0x1                           ; 0809DFE4
bx    lr                            ; 0809DFE6

SoftResetSinglePlayer:
ldr   r3,=0x04000208                ; 0809DFE8
mov   r2,0x0                        ; 0809DFEA
strb  r2,[r3]                       ; 0809DFEC
ldr   r1,=0x03007F00                ; 0809DFEE
mov   sp,r1                         ; 0809DFF0
swi   0x1                           ; 0809DFF2
swi   0x0                           ; 0809DFF4
.pool                               ; 0809DFF6

swi_SoundBias_0:
mov   r0,0x0                        ; 0809E000
swi   0x19                          ; 0809E002
bx    lr                            ; 0809E004
.pool                               ; 0809E006

swi_SoundBias_1:
mov   r0,0x1                        ; 0809E008
swi   0x19                          ; 0809E00A
bx    lr                            ; 0809E00C
.pool                               ; 0809E00E

SoftResetMultiplayer:
ldr   r3,=0x04000208                ; 0809E010
mov   r2,0x0                        ; 0809E012
strb  r2,[r3]                       ; 0809E014
ldr   r3,=0x03007FFA                ; 0809E016
mov   r2,0x0                        ; 0809E018
strb  r2,[r3]                       ; 0809E01A
sub   r3,0xFA                       ; 0809E01C
mov   sp,r3                         ; 0809E01E
swi   0x1                           ; 0809E020
swi   0x0                           ; 0809E022
.pool                               ; 0809E024

Sub0809E02C:
lsl   r0,r0,0x10                    ; 0809E02C
lsr   r0,r0,0x10                    ; 0809E02E
mov   r2,0x0                        ; 0809E030
cmp   r0,0x4                        ; 0809E032
bne   @@Code0809E048                ; 0809E034
ldr   r1,=0x03007BC8                ; 0809E036
ldr   r0,=Data081779DC              ; 0809E038
str   r0,[r1]                       ; 0809E03A
b     @@Code0809E064                ; 0809E03C
.pool                               ; 0809E03E

@@Code0809E048:
cmp   r0,0x40                       ; 0809E048
bne   @@Code0809E05C                ; 0809E04A
ldr   r1,=0x03007BC8                ; 0809E04C
ldr   r0,=Data081779E8              ; 0809E04E
str   r0,[r1]                       ; 0809E050
b     @@Code0809E064                ; 0809E052
.pool                               ; 0809E054

@@Code0809E05C:
ldr   r1,=0x03007BC8                ; 0809E05C
ldr   r0,=Data081779DC              ; 0809E05E
str   r0,[r1]                       ; 0809E060
mov   r2,0x1                        ; 0809E062
@@Code0809E064:
mov   r0,r2                         ; 0809E064
bx    lr                            ; 0809E066
.pool                               ; 0809E068

Sub0809E070:
ldr   r1,=0x030022F2                ; 0809E070
ldrh  r0,[r1]                       ; 0809E072
cmp   r0,0x0                        ; 0809E074
beq   @@Code0809E08A                ; 0809E076
ldrh  r0,[r1]                       ; 0809E078
sub   r0,0x1                        ; 0809E07A
strh  r0,[r1]                       ; 0809E07C
lsl   r0,r0,0x10                    ; 0809E07E
cmp   r0,0x0                        ; 0809E080
bne   @@Code0809E08A                ; 0809E082
ldr   r1,=0x030022F4                ; 0809E084
mov   r0,0x1                        ; 0809E086
strb  r0,[r1]                       ; 0809E088
@@Code0809E08A:
bx    lr                            ; 0809E08A
.pool                               ; 0809E08C

Sub0809E094:
mov   r2,r1                         ; 0809E094
lsl   r0,r0,0x18                    ; 0809E096
lsr   r1,r0,0x18                    ; 0809E098
cmp   r1,0x3                        ; 0809E09A
bhi   @@Code0809E0C8                ; 0809E09C
ldr   r0,=0x030022F0                ; 0809E09E
strb  r1,[r0]                       ; 0809E0A0
ldr   r1,=0x030022F8                ; 0809E0A2
ldrb  r0,[r0]                       ; 0809E0A4
lsl   r0,r0,0x2                     ; 0809E0A6
ldr   r3,=0x04000100                ; 0809E0A8
add   r0,r0,r3                      ; 0809E0AA
str   r0,[r1]                       ; 0809E0AC
ldr   r0,=Sub0809E070+1             ; 0809E0AE
str   r0,[r2]                       ; 0809E0B0
mov   r0,0x0                        ; 0809E0B2
b     @@Code0809E0CA                ; 0809E0B4
.pool                               ; 0809E0B6

@@Code0809E0C8:
mov   r0,0x1                        ; 0809E0C8
@@Code0809E0CA:
bx    lr                            ; 0809E0CA

Sub0809E0CC:
push  {r4-r7,lr}                    ; 0809E0CC
mov   r7,r9                         ; 0809E0CE
mov   r6,r8                         ; 0809E0D0
push  {r6-r7}                       ; 0809E0D2
ldr   r2,=0x030022FC                ; 0809E0D4
ldr   r1,=0x04000208                ; 0809E0D6
mov   r9,r1                         ; 0809E0D8
ldrh  r1,[r1]                       ; 0809E0DA
strh  r1,[r2]                       ; 0809E0DC
mov   r6,0x0                        ; 0809E0DE
mov   r2,r9                         ; 0809E0E0
strh  r6,[r2]                       ; 0809E0E2
ldr   r3,=0x030022F8                ; 0809E0E4
mov   r8,r3                         ; 0809E0E6
ldr   r5,[r3]                       ; 0809E0E8
strh  r6,[r5,0x2]                   ; 0809E0EA
ldr   r3,=0x04000202                ; 0809E0EC
ldr   r4,=0x030022F0                ; 0809E0EE
ldrb  r1,[r4]                       ; 0809E0F0
mov   r2,0x8                        ; 0809E0F2
mov   r7,r2                         ; 0809E0F4
lsl   r7,r1                         ; 0809E0F6
mov   r1,r7                         ; 0809E0F8
strh  r1,[r3]                       ; 0809E0FA
sub   r3,0x2                        ; 0809E0FC
ldrb  r1,[r4]                       ; 0809E0FE
lsl   r2,r1                         ; 0809E100
ldrh  r1,[r3]                       ; 0809E102
orr   r1,r2                         ; 0809E104
strh  r1,[r3]                       ; 0809E106
ldr   r1,=0x030022F4                ; 0809E108
strb  r6,[r1]                       ; 0809E10A
ldr   r2,=0x030022F2                ; 0809E10C
ldrh  r1,[r0]                       ; 0809E10E
strh  r1,[r2]                       ; 0809E110
add   r0,0x2                        ; 0809E112
ldrh  r1,[r0]                       ; 0809E114
strh  r1,[r5]                       ; 0809E116
add   r1,r5,0x2                     ; 0809E118
mov   r2,r8                         ; 0809E11A
str   r1,[r2]                       ; 0809E11C
ldrh  r0,[r0,0x2]                   ; 0809E11E
strh  r0,[r5,0x2]                   ; 0809E120
str   r5,[r2]                       ; 0809E122
mov   r0,0x1                        ; 0809E124
mov   r3,r9                         ; 0809E126
strh  r0,[r3]                       ; 0809E128
pop   {r3-r4}                       ; 0809E12A
mov   r8,r3                         ; 0809E12C
mov   r9,r4                         ; 0809E12E
pop   {r4-r7}                       ; 0809E130
pop   {r0}                          ; 0809E132
bx    r0                            ; 0809E134
.pool                               ; 0809E136

Sub0809E154:
ldr   r3,=0x04000208                ; 0809E154
mov   r1,0x0                        ; 0809E156
strh  r1,[r3]                       ; 0809E158
ldr   r2,=0x030022F8                ; 0809E15A
ldr   r0,[r2]                       ; 0809E15C
strh  r1,[r0]                       ; 0809E15E
add   r0,0x2                        ; 0809E160
str   r0,[r2]                       ; 0809E162
strh  r1,[r0]                       ; 0809E164
sub   r0,0x2                        ; 0809E166
str   r0,[r2]                       ; 0809E168
ldr   r2,=0x04000200                ; 0809E16A
ldr   r0,=0x030022F0                ; 0809E16C
ldrb  r0,[r0]                       ; 0809E16E
mov   r1,0x8                        ; 0809E170
lsl   r1,r0                         ; 0809E172
ldrh  r0,[r2]                       ; 0809E174
bic   r0,r1                         ; 0809E176
strh  r0,[r2]                       ; 0809E178
ldr   r0,=0x030022FC                ; 0809E17A
ldrh  r0,[r0]                       ; 0809E17C
strh  r0,[r3]                       ; 0809E17E
bx    lr                            ; 0809E180
.pool                               ; 0809E182

Sub0809E198:
push  {r4-r6,lr}                    ; 0809E198
lsl   r2,r2,0x10                    ; 0809E19A
lsr   r2,r2,0x10                    ; 0809E19C
ldr   r4,=0x04000208                ; 0809E19E
ldrh  r3,[r4]                       ; 0809E1A0
mov   r6,r3                         ; 0809E1A2
mov   r3,0x0                        ; 0809E1A4
strh  r3,[r4]                       ; 0809E1A6
ldr   r5,=0x04000204                ; 0809E1A8
ldrh  r4,[r5]                       ; 0809E1AA
ldr   r3,=0xF8FF                    ; 0809E1AC
and   r4,r3                         ; 0809E1AE
ldr   r3,=0x03007BC8                ; 0809E1B0
ldr   r3,[r3]                       ; 0809E1B2
ldrh  r3,[r3,0x6]                   ; 0809E1B4
orr   r4,r3                         ; 0809E1B6
strh  r4,[r5]                       ; 0809E1B8
ldr   r3,=0x040000D4                ; 0809E1BA
str   r0,[r3]                       ; 0809E1BC
ldr   r0,=0x040000D8                ; 0809E1BE
str   r1,[r0]                       ; 0809E1C0
ldr   r1,=0x040000DC                ; 0809E1C2
mov   r0,0x80                       ; 0809E1C4
lsl   r0,r0,0x18                    ; 0809E1C6
orr   r2,r0                         ; 0809E1C8
str   r2,[r1]                       ; 0809E1CA
add   r1,0x2                        ; 0809E1CC
mov   r2,0x80                       ; 0809E1CE
lsl   r2,r2,0x8                     ; 0809E1D0
mov   r0,r2                         ; 0809E1D2
ldrh  r1,[r1]                       ; 0809E1D4
and   r0,r1                         ; 0809E1D6
cmp   r0,0x0                        ; 0809E1D8
beq   @@Code0809E1EC                ; 0809E1DA
ldr   r2,=0x040000DE                ; 0809E1DC
mov   r0,0x80                       ; 0809E1DE
lsl   r0,r0,0x8                     ; 0809E1E0
mov   r1,r0                         ; 0809E1E2
@@Code0809E1E4:
ldrh  r0,[r2]                       ; 0809E1E4
and   r0,r1                         ; 0809E1E6
cmp   r0,0x0                        ; 0809E1E8
bne   @@Code0809E1E4                ; 0809E1EA
@@Code0809E1EC:
ldr   r0,=0x04000208                ; 0809E1EC
strh  r6,[r0]                       ; 0809E1EE
pop   {r4-r6}                       ; 0809E1F0
pop   {r0}                          ; 0809E1F2
bx    r0                            ; 0809E1F4
.pool                               ; 0809E1F6

Sub0809E218:
push  {r4-r6,lr}                    ; 0809E218
add   sp,-0x88                      ; 0809E21A
mov   r5,r1                         ; 0809E21C
lsl   r0,r0,0x10                    ; 0809E21E
lsr   r3,r0,0x10                    ; 0809E220
ldr   r0,=0x03007BC8                ; 0809E222
ldr   r0,[r0]                       ; 0809E224
ldrh  r0,[r0,0x4]                   ; 0809E226
cmp   r3,r0                         ; 0809E228
blo   @@Code0809E238                ; 0809E22A
ldr   r0,=0x80FF                    ; 0809E22C
b     @@Code0809E2BA                ; 0809E22E
.pool                               ; 0809E230

@@Code0809E238:
ldr   r0,=0x03007BC8                ; 0809E238
mov   r6,r0                         ; 0809E23A
ldr   r0,[r0]                       ; 0809E23C
ldrb  r1,[r0,0x8]                   ; 0809E23E
lsl   r0,r1,0x1                     ; 0809E240
mov   r4,sp                         ; 0809E242
add   r2,r0,r4                      ; 0809E244
add   r2,0x2                        ; 0809E246
mov   r4,0x0                        ; 0809E248
cmp   r4,r1                         ; 0809E24A
bhs   @@Code0809E262                ; 0809E24C
@@Code0809E24E:
strh  r3,[r2]                       ; 0809E24E
sub   r2,0x2                        ; 0809E250
lsr   r3,r3,0x1                     ; 0809E252
add   r0,r4,0x1                     ; 0809E254
lsl   r0,r0,0x18                    ; 0809E256
lsr   r4,r0,0x18                    ; 0809E258
ldr   r0,[r6]                       ; 0809E25A
ldrb  r0,[r0,0x8]                   ; 0809E25C
cmp   r4,r0                         ; 0809E25E
blo   @@Code0809E24E                ; 0809E260
@@Code0809E262:
mov   r0,0x1                        ; 0809E262
strh  r0,[r2]                       ; 0809E264
sub   r2,0x2                        ; 0809E266
strh  r0,[r2]                       ; 0809E268
mov   r4,0xD0                       ; 0809E26A
lsl   r4,r4,0x14                    ; 0809E26C
ldr   r0,=0x03007BC8                ; 0809E26E
ldr   r0,[r0]                       ; 0809E270
ldrb  r2,[r0,0x8]                   ; 0809E272
add   r2,0x3                        ; 0809E274
mov   r0,sp                         ; 0809E276
mov   r1,r4                         ; 0809E278
bl    Sub0809E198                   ; 0809E27A
mov   r0,r4                         ; 0809E27E
mov   r1,sp                         ; 0809E280
mov   r2,0x44                       ; 0809E282
bl    Sub0809E198                   ; 0809E284
add   r2,sp,0x8                     ; 0809E288
add   r5,0x6                        ; 0809E28A
mov   r4,0x0                        ; 0809E28C
mov   r6,0x1                        ; 0809E28E
@@Code0809E290:
mov   r1,0x0                        ; 0809E290
mov   r3,0x0                        ; 0809E292
@@Code0809E294:
lsl   r1,r1,0x11                    ; 0809E294
ldrh  r0,[r2]                       ; 0809E296
and   r0,r6                         ; 0809E298
lsr   r1,r1,0x10                    ; 0809E29A
orr   r1,r0                         ; 0809E29C
add   r2,0x2                        ; 0809E29E
add   r0,r3,0x1                     ; 0809E2A0
lsl   r0,r0,0x18                    ; 0809E2A2
lsr   r3,r0,0x18                    ; 0809E2A4
cmp   r3,0xF                        ; 0809E2A6
bls   @@Code0809E294                ; 0809E2A8
strh  r1,[r5]                       ; 0809E2AA
sub   r5,0x2                        ; 0809E2AC
add   r0,r4,0x1                     ; 0809E2AE
lsl   r0,r0,0x18                    ; 0809E2B0
lsr   r4,r0,0x18                    ; 0809E2B2
cmp   r4,0x3                        ; 0809E2B4
bls   @@Code0809E290                ; 0809E2B6
mov   r0,0x0                        ; 0809E2B8
@@Code0809E2BA:
add   sp,0x88                       ; 0809E2BA
pop   {r4-r6}                       ; 0809E2BC
pop   {r1}                          ; 0809E2BE
bx    r1                            ; 0809E2C0
.pool                               ; 0809E2C2

Sub0809E2C8:
push  {r4-r5,lr}                    ; 0809E2C8
add   sp,-0xA4                      ; 0809E2CA
mov   r5,r1                         ; 0809E2CC
lsl   r0,r0,0x10                    ; 0809E2CE
lsr   r4,r0,0x10                    ; 0809E2D0
ldr   r0,=0x03007BC8                ; 0809E2D2
ldr   r0,[r0]                       ; 0809E2D4
ldrh  r0,[r0,0x4]                   ; 0809E2D6
cmp   r4,r0                         ; 0809E2D8
blo   @@Code0809E2E8                ; 0809E2DA
ldr   r0,=0x80FF                    ; 0809E2DC
b     @@Code0809E38C                ; 0809E2DE
.pool                               ; 0809E2E0

@@Code0809E2E8:
ldr   r0,=0x03007BC8                ; 0809E2E8
ldr   r0,[r0]                       ; 0809E2EA
ldrb  r0,[r0,0x8]                   ; 0809E2EC
lsl   r0,r0,0x1                     ; 0809E2EE
mov   r1,sp                         ; 0809E2F0
add   r3,r0,r1                      ; 0809E2F2
add   r3,0x84                       ; 0809E2F4
mov   r0,0x0                        ; 0809E2F6
strh  r0,[r3]                       ; 0809E2F8
sub   r3,0x2                        ; 0809E2FA
mov   r1,0x0                        ; 0809E2FC
@@Code0809E2FE:
ldrh  r2,[r5]                       ; 0809E2FE
add   r5,0x2                        ; 0809E300
mov   r0,0x0                        ; 0809E302
@@Code0809E304:
strh  r2,[r3]                       ; 0809E304
sub   r3,0x2                        ; 0809E306
lsr   r2,r2,0x1                     ; 0809E308
add   r0,0x1                        ; 0809E30A
lsl   r0,r0,0x18                    ; 0809E30C
lsr   r0,r0,0x18                    ; 0809E30E
cmp   r0,0xF                        ; 0809E310
bls   @@Code0809E304                ; 0809E312
add   r0,r1,0x1                     ; 0809E314
lsl   r0,r0,0x18                    ; 0809E316
lsr   r1,r0,0x18                    ; 0809E318
cmp   r1,0x3                        ; 0809E31A
bls   @@Code0809E2FE                ; 0809E31C
mov   r1,0x0                        ; 0809E31E
ldr   r0,=0x03007BC8                ; 0809E320
mov   r2,r0                         ; 0809E322
ldr   r0,[r0]                       ; 0809E324
b     @@Code0809E33A                ; 0809E326
.pool                               ; 0809E328

@@Code0809E32C:
strh  r4,[r3]                       ; 0809E32C
sub   r3,0x2                        ; 0809E32E
lsr   r4,r4,0x1                     ; 0809E330
add   r0,r1,0x1                     ; 0809E332
lsl   r0,r0,0x18                    ; 0809E334
lsr   r1,r0,0x18                    ; 0809E336
ldr   r0,[r2]                       ; 0809E338
@@Code0809E33A:
ldrb  r0,[r0,0x8]                   ; 0809E33A
cmp   r1,r0                         ; 0809E33C
blo   @@Code0809E32C                ; 0809E33E
mov   r0,0x0                        ; 0809E340
strh  r0,[r3]                       ; 0809E342
sub   r3,0x2                        ; 0809E344
mov   r0,0x1                        ; 0809E346
strh  r0,[r3]                       ; 0809E348
mov   r1,0xD0                       ; 0809E34A
lsl   r1,r1,0x14                    ; 0809E34C
ldr   r0,=0x03007BC8                ; 0809E34E
ldr   r0,[r0]                       ; 0809E350
ldrb  r2,[r0,0x8]                   ; 0809E352
add   r2,0x43                       ; 0809E354
mov   r0,sp                         ; 0809E356
bl    Sub0809E198                   ; 0809E358
ldr   r0,=Data081779F4              ; 0809E35C
bl    Sub0809E0CC                   ; 0809E35E
mov   r4,0x0                        ; 0809E362
mov   r1,0xD0                       ; 0809E364
lsl   r1,r1,0x14                    ; 0809E366
mov   r3,0x1                        ; 0809E368
ldr   r2,=0x030022F4                ; 0809E36A
@@Code0809E36C:
ldrh  r0,[r1]                       ; 0809E36C
and   r0,r3                         ; 0809E36E
cmp   r0,0x0                        ; 0809E370
bne   @@Code0809E386                ; 0809E372
ldrb  r0,[r2]                       ; 0809E374
cmp   r0,0x0                        ; 0809E376
beq   @@Code0809E36C                ; 0809E378
ldrh  r0,[r1]                       ; 0809E37A
mov   r1,0x1                        ; 0809E37C
and   r0,r1                         ; 0809E37E
cmp   r0,0x0                        ; 0809E380
bne   @@Code0809E386                ; 0809E382
ldr   r4,=0xC001                    ; 0809E384
@@Code0809E386:
bl    Sub0809E154                   ; 0809E386
mov   r0,r4                         ; 0809E38A
@@Code0809E38C:
add   sp,0xA4                       ; 0809E38C
pop   {r4-r5}                       ; 0809E38E
pop   {r1}                          ; 0809E390
bx    r1                            ; 0809E392
.pool                               ; 0809E394

Sub0809E3A4:
push  {r4-r5,lr}                    ; 0809E3A4
add   sp,-0x8                       ; 0809E3A6
mov   r4,r1                         ; 0809E3A8
lsl   r0,r0,0x10                    ; 0809E3AA
lsr   r1,r0,0x10                    ; 0809E3AC
mov   r5,0x0                        ; 0809E3AE
ldr   r0,=0x03007BC8                ; 0809E3B0
ldr   r0,[r0]                       ; 0809E3B2
ldrh  r0,[r0,0x4]                   ; 0809E3B4
cmp   r1,r0                         ; 0809E3B6
blo   @@Code0809E3C8                ; 0809E3B8
ldr   r0,=0x80FF                    ; 0809E3BA
b     @@Code0809E3F2                ; 0809E3BC
.pool                               ; 0809E3BE

@@Code0809E3C8:
mov   r0,r1                         ; 0809E3C8
mov   r1,sp                         ; 0809E3CA
bl    Sub0809E218                   ; 0809E3CC
mov   r2,sp                         ; 0809E3D0
mov   r3,0x0                        ; 0809E3D2
b     @@Code0809E3E0                ; 0809E3D4
@@Code0809E3D6:
add   r0,r3,0x1                     ; 0809E3D6
lsl   r0,r0,0x18                    ; 0809E3D8
lsr   r3,r0,0x18                    ; 0809E3DA
cmp   r3,0x3                        ; 0809E3DC
bhi   @@Code0809E3F0                ; 0809E3DE
@@Code0809E3E0:
ldrh  r1,[r4]                       ; 0809E3E0
ldrh  r0,[r2]                       ; 0809E3E2
add   r2,0x2                        ; 0809E3E4
add   r4,0x2                        ; 0809E3E6
cmp   r1,r0                         ; 0809E3E8
beq   @@Code0809E3D6                ; 0809E3EA
mov   r5,0x80                       ; 0809E3EC
lsl   r5,r5,0x8                     ; 0809E3EE
@@Code0809E3F0:
mov   r0,r5                         ; 0809E3F0
@@Code0809E3F2:
add   sp,0x8                        ; 0809E3F2
pop   {r4-r5}                       ; 0809E3F4
pop   {r1}                          ; 0809E3F6
bx    r1                            ; 0809E3F8
.pool                               ; 0809E3FA

Sub0809E3FC:
push  {r4-r6,lr}                    ; 0809E3FC
mov   r5,r1                         ; 0809E3FE
lsl   r0,r0,0x10                    ; 0809E400
lsr   r4,r0,0x10                    ; 0809E402
mov   r6,0x0                        ; 0809E404
b     @@Code0809E40E                ; 0809E406
@@Code0809E408:
add   r0,r6,0x1                     ; 0809E408
lsl   r0,r0,0x18                    ; 0809E40A
lsr   r6,r0,0x18                    ; 0809E40C
@@Code0809E40E:
cmp   r6,0x2                        ; 0809E40E
bhi   @@Code0809E432                ; 0809E410
mov   r0,r4                         ; 0809E412
mov   r1,r5                         ; 0809E414
bl    Sub0809E2C8                   ; 0809E416
lsl   r0,r0,0x10                    ; 0809E41A
lsr   r2,r0,0x10                    ; 0809E41C
cmp   r2,0x0                        ; 0809E41E
bne   @@Code0809E408                ; 0809E420
mov   r0,r4                         ; 0809E422
mov   r1,r5                         ; 0809E424
bl    Sub0809E3A4                   ; 0809E426
lsl   r0,r0,0x10                    ; 0809E42A
lsr   r2,r0,0x10                    ; 0809E42C
cmp   r2,0x0                        ; 0809E42E
bne   @@Code0809E408                ; 0809E430
@@Code0809E432:
mov   r0,r2                         ; 0809E432
pop   {r4-r6}                       ; 0809E434
pop   {r1}                          ; 0809E436
bx    r1                            ; 0809E438
.pool                               ; 0809E43A

Sub_bx_r0:
bx    r0                            ; 0809E43C
nop                                 ; 0809E43E

Sub_bx_r1:
bx    r1                            ; 0809E440
nop                                 ; 0809E442

Sub_bx_r2:
bx    r2                            ; 0809E444
nop                                 ; 0809E446

Sub_bx_r3:
bx    r3                            ; 0809E448
nop                                 ; 0809E44A

Sub_bx_r4:
bx    r4                            ; 0809E44C
nop                                 ; 0809E44E

Sub_bx_r5:
bx    r5                            ; 0809E450
nop                                 ; 0809E452

bx    r6                            ; 0809E454
nop                                 ; 0809E456

Sub_bx_r7:
bx    r7                            ; 0809E458
nop                                 ; 0809E45A

Sub_bx_r8:
bx    r8                            ; 0809E45C
nop                                 ; 0809E45E

bx    r9                            ; 0809E460
nop                                 ; 0809E462

bx    r10                           ; 0809E464
nop                                 ; 0809E466

bx    r11                           ; 0809E468
nop                                 ; 0809E46A

bx    r12                           ; 0809E46C
nop                                 ; 0809E46E

bx    sp                            ; 0809E470
nop                                 ; 0809E472

bx    lr                            ; 0809E474
nop                                 ; 0809E476

Sub0809E478:
cmp   r1,0x0                        ; 0809E478
beq   @@Code0809E500                ; 0809E47A
push  {r4}                          ; 0809E47C
mov   r4,r0                         ; 0809E47E
eor   r4,r1                         ; 0809E480
mov   r12,r4                        ; 0809E482
mov   r3,0x1                        ; 0809E484
mov   r2,0x0                        ; 0809E486
cmp   r1,0x0                        ; 0809E488
bpl   @@Code0809E48E                ; 0809E48A
neg   r1,r1                         ; 0809E48C
@@Code0809E48E:
cmp   r0,0x0                        ; 0809E48E
bpl   @@Code0809E494                ; 0809E490
neg   r0,r0                         ; 0809E492
@@Code0809E494:
cmp   r0,r1                         ; 0809E494
blo   @@Code0809E4F2                ; 0809E496
mov   r4,0x1                        ; 0809E498
lsl   r4,r4,0x1C                    ; 0809E49A
@@Code0809E49C:
cmp   r1,r4                         ; 0809E49C
bhs   @@Code0809E4AA                ; 0809E49E
cmp   r1,r0                         ; 0809E4A0
bhs   @@Code0809E4AA                ; 0809E4A2
lsl   r1,r1,0x4                     ; 0809E4A4
lsl   r3,r3,0x4                     ; 0809E4A6
b     @@Code0809E49C                ; 0809E4A8
@@Code0809E4AA:
lsl   r4,r4,0x3                     ; 0809E4AA
@@Code0809E4AC:
cmp   r1,r4                         ; 0809E4AC
bhs   @@Code0809E4BA                ; 0809E4AE
cmp   r1,r0                         ; 0809E4B0
bhs   @@Code0809E4BA                ; 0809E4B2
lsl   r1,r1,0x1                     ; 0809E4B4
lsl   r3,r3,0x1                     ; 0809E4B6
b     @@Code0809E4AC                ; 0809E4B8
@@Code0809E4BA:
cmp   r0,r1                         ; 0809E4BA
blo   @@Code0809E4C2                ; 0809E4BC
sub   r0,r0,r1                      ; 0809E4BE
orr   r2,r3                         ; 0809E4C0
@@Code0809E4C2:
lsr   r4,r1,0x1                     ; 0809E4C2
cmp   r0,r4                         ; 0809E4C4
blo   @@Code0809E4CE                ; 0809E4C6
sub   r0,r0,r4                      ; 0809E4C8
lsr   r4,r3,0x1                     ; 0809E4CA
orr   r2,r4                         ; 0809E4CC
@@Code0809E4CE:
lsr   r4,r1,0x2                     ; 0809E4CE
cmp   r0,r4                         ; 0809E4D0
blo   @@Code0809E4DA                ; 0809E4D2
sub   r0,r0,r4                      ; 0809E4D4
lsr   r4,r3,0x2                     ; 0809E4D6
orr   r2,r4                         ; 0809E4D8
@@Code0809E4DA:
lsr   r4,r1,0x3                     ; 0809E4DA
cmp   r0,r4                         ; 0809E4DC
blo   @@Code0809E4E6                ; 0809E4DE
sub   r0,r0,r4                      ; 0809E4E0
lsr   r4,r3,0x3                     ; 0809E4E2
orr   r2,r4                         ; 0809E4E4
@@Code0809E4E6:
cmp   r0,0x0                        ; 0809E4E6
beq   @@Code0809E4F2                ; 0809E4E8
lsr   r3,r3,0x4                     ; 0809E4EA
beq   @@Code0809E4F2                ; 0809E4EC
lsr   r1,r1,0x4                     ; 0809E4EE
b     @@Code0809E4BA                ; 0809E4F0
@@Code0809E4F2:
mov   r0,r2                         ; 0809E4F2
mov   r4,r12                        ; 0809E4F4
cmp   r4,0x0                        ; 0809E4F6
bpl   @@Code0809E4FC                ; 0809E4F8
neg   r0,r0                         ; 0809E4FA
@@Code0809E4FC:
pop   {r4}                          ; 0809E4FC
mov   pc,lr                         ; 0809E4FE

@@Code0809E500:
push  {lr}                          ; 0809E500
bl    Sub0809E50C                   ; 0809E502
mov   r0,0x0                        ; 0809E506
pop   {pc}                          ; 0809E508
.pool                               ; 0809E50A

Sub0809E50C:
mov   pc,lr                         ; 0809E50C
.pool                               ; 0809E50E

Sub0809E510:
cmp   r1,0x0                        ; 0809E510
beq   @@Code0809E57E                ; 0809E512
mov   r3,0x1                        ; 0809E514
mov   r2,0x0                        ; 0809E516
push  {r4}                          ; 0809E518
cmp   r0,r1                         ; 0809E51A
blo   @@Code0809E578                ; 0809E51C
mov   r4,0x1                        ; 0809E51E
lsl   r4,r4,0x1C                    ; 0809E520
@@Code0809E522:
cmp   r1,r4                         ; 0809E522
bhs   @@Code0809E530                ; 0809E524
cmp   r1,r0                         ; 0809E526
bhs   @@Code0809E530                ; 0809E528
lsl   r1,r1,0x4                     ; 0809E52A
lsl   r3,r3,0x4                     ; 0809E52C
b     @@Code0809E522                ; 0809E52E
@@Code0809E530:
lsl   r4,r4,0x3                     ; 0809E530
@@Code0809E532:
cmp   r1,r4                         ; 0809E532
bhs   @@Code0809E540                ; 0809E534
cmp   r1,r0                         ; 0809E536
bhs   @@Code0809E540                ; 0809E538
lsl   r1,r1,0x1                     ; 0809E53A
lsl   r3,r3,0x1                     ; 0809E53C
b     @@Code0809E532                ; 0809E53E
@@Code0809E540:
cmp   r0,r1                         ; 0809E540
blo   @@Code0809E548                ; 0809E542
sub   r0,r0,r1                      ; 0809E544
orr   r2,r3                         ; 0809E546
@@Code0809E548:
lsr   r4,r1,0x1                     ; 0809E548
cmp   r0,r4                         ; 0809E54A
blo   @@Code0809E554                ; 0809E54C
sub   r0,r0,r4                      ; 0809E54E
lsr   r4,r3,0x1                     ; 0809E550
orr   r2,r4                         ; 0809E552
@@Code0809E554:
lsr   r4,r1,0x2                     ; 0809E554
cmp   r0,r4                         ; 0809E556
blo   @@Code0809E560                ; 0809E558
sub   r0,r0,r4                      ; 0809E55A
lsr   r4,r3,0x2                     ; 0809E55C
orr   r2,r4                         ; 0809E55E
@@Code0809E560:
lsr   r4,r1,0x3                     ; 0809E560
cmp   r0,r4                         ; 0809E562
blo   @@Code0809E56C                ; 0809E564
sub   r0,r0,r4                      ; 0809E566
lsr   r4,r3,0x3                     ; 0809E568
orr   r2,r4                         ; 0809E56A
@@Code0809E56C:
cmp   r0,0x0                        ; 0809E56C
beq   @@Code0809E578                ; 0809E56E
lsr   r3,r3,0x4                     ; 0809E570
beq   @@Code0809E578                ; 0809E572
lsr   r1,r1,0x4                     ; 0809E574
b     @@Code0809E540                ; 0809E576
@@Code0809E578:
mov   r0,r2                         ; 0809E578
pop   {r4}                          ; 0809E57A
mov   pc,lr                         ; 0809E57C

@@Code0809E57E:
push  {lr}                          ; 0809E57E
bl    Sub0809E50C                   ; 0809E580
mov   r0,0x0                        ; 0809E584
pop   {pc}                          ; 0809E586

Sub0809E588:
cmp   r1,0x0                        ; 0809E588
beq   @@Code0809E63E                ; 0809E58A
mov   r3,0x1                        ; 0809E58C
cmp   r0,r1                         ; 0809E58E
bhs   @@Code0809E594                ; 0809E590
mov   pc,lr                         ; 0809E592

@@Code0809E594:
push  {r4}                          ; 0809E594
mov   r4,0x1                        ; 0809E596
lsl   r4,r4,0x1C                    ; 0809E598
@@Code0809E59A:
cmp   r1,r4                         ; 0809E59A
bhs   @@Code0809E5A8                ; 0809E59C
cmp   r1,r0                         ; 0809E59E
bhs   @@Code0809E5A8                ; 0809E5A0
lsl   r1,r1,0x4                     ; 0809E5A2
lsl   r3,r3,0x4                     ; 0809E5A4
b     @@Code0809E59A                ; 0809E5A6
@@Code0809E5A8:
lsl   r4,r4,0x3                     ; 0809E5A8
@@Code0809E5AA:
cmp   r1,r4                         ; 0809E5AA
bhs   @@Code0809E5B8                ; 0809E5AC
cmp   r1,r0                         ; 0809E5AE
bhs   @@Code0809E5B8                ; 0809E5B0
lsl   r1,r1,0x1                     ; 0809E5B2
lsl   r3,r3,0x1                     ; 0809E5B4
b     @@Code0809E5AA                ; 0809E5B6
@@Code0809E5B8:
mov   r2,0x0                        ; 0809E5B8
cmp   r0,r1                         ; 0809E5BA
blo   @@Code0809E5C0                ; 0809E5BC
sub   r0,r0,r1                      ; 0809E5BE
@@Code0809E5C0:
lsr   r4,r1,0x1                     ; 0809E5C0
cmp   r0,r4                         ; 0809E5C2
blo   @@Code0809E5D2                ; 0809E5C4
sub   r0,r0,r4                      ; 0809E5C6
mov   r12,r3                        ; 0809E5C8
mov   r4,0x1                        ; 0809E5CA
ror   r3,r4                         ; 0809E5CC
orr   r2,r3                         ; 0809E5CE
mov   r3,r12                        ; 0809E5D0
@@Code0809E5D2:
lsr   r4,r1,0x2                     ; 0809E5D2
cmp   r0,r4                         ; 0809E5D4
blo   @@Code0809E5E4                ; 0809E5D6
sub   r0,r0,r4                      ; 0809E5D8
mov   r12,r3                        ; 0809E5DA
mov   r4,0x2                        ; 0809E5DC
ror   r3,r4                         ; 0809E5DE
orr   r2,r3                         ; 0809E5E0
mov   r3,r12                        ; 0809E5E2
@@Code0809E5E4:
lsr   r4,r1,0x3                     ; 0809E5E4
cmp   r0,r4                         ; 0809E5E6
blo   @@Code0809E5F6                ; 0809E5E8
sub   r0,r0,r4                      ; 0809E5EA
mov   r12,r3                        ; 0809E5EC
mov   r4,0x3                        ; 0809E5EE
ror   r3,r4                         ; 0809E5F0
orr   r2,r3                         ; 0809E5F2
mov   r3,r12                        ; 0809E5F4
@@Code0809E5F6:
mov   r12,r3                        ; 0809E5F6
cmp   r0,0x0                        ; 0809E5F8
beq   @@Code0809E604                ; 0809E5FA
lsr   r3,r3,0x4                     ; 0809E5FC
beq   @@Code0809E604                ; 0809E5FE
lsr   r1,r1,0x4                     ; 0809E600
b     @@Code0809E5B8                ; 0809E602
@@Code0809E604:
mov   r4,0xE                        ; 0809E604
lsl   r4,r4,0x1C                    ; 0809E606
and   r2,r4                         ; 0809E608
bne   @@Code0809E610                ; 0809E60A
pop   {r4}                          ; 0809E60C
mov   pc,lr                         ; 0809E60E

@@Code0809E610:
mov   r3,r12                        ; 0809E610
mov   r4,0x3                        ; 0809E612
ror   r3,r4                         ; 0809E614
tst   r2,r3                         ; 0809E616
beq   @@Code0809E61E                ; 0809E618
lsr   r4,r1,0x3                     ; 0809E61A
add   r0,r0,r4                      ; 0809E61C
@@Code0809E61E:
mov   r3,r12                        ; 0809E61E
mov   r4,0x2                        ; 0809E620
ror   r3,r4                         ; 0809E622
tst   r2,r3                         ; 0809E624
beq   @@Code0809E62C                ; 0809E626
lsr   r4,r1,0x2                     ; 0809E628
add   r0,r0,r4                      ; 0809E62A
@@Code0809E62C:
mov   r3,r12                        ; 0809E62C
mov   r4,0x1                        ; 0809E62E
ror   r3,r4                         ; 0809E630
tst   r2,r3                         ; 0809E632
beq   @@Code0809E63A                ; 0809E634
lsr   r4,r1,0x1                     ; 0809E636
add   r0,r0,r4                      ; 0809E638
@@Code0809E63A:
pop   {r4}                          ; 0809E63A
mov   pc,lr                         ; 0809E63C

@@Code0809E63E:
push  {lr}                          ; 0809E63E
bl    Sub0809E50C                   ; 0809E640
mov   r0,0x0                        ; 0809E644
pop   {pc}                          ; 0809E646

Sub0809E648:
push  {r4-r7,lr}                    ; 0809E648
add   sp,-0x8                       ; 0809E64A
mov   r1,r0                         ; 0809E64C
ldr   r4,[r1,0xC]                   ; 0809E64E
ldr   r5,[r1,0x10]                  ; 0809E650
ldr   r7,[r1,0x4]                   ; 0809E652
mov   r6,0x0                        ; 0809E654
mov   r2,0x0                        ; 0809E656
ldr   r0,[r1]                       ; 0809E658
cmp   r0,0x1                        ; 0809E65A
bhi   @@Code0809E660                ; 0809E65C
mov   r2,0x1                        ; 0809E65E
@@Code0809E660:
cmp   r2,0x0                        ; 0809E660
beq   @@Code0809E680                ; 0809E662
ldr   r6,=0x07FF                    ; 0809E664
ldr   r2,=0x0                       ; 0809E666
ldr   r3,=0x00080000                ; 0809E668
mov   r0,r4                         ; 0809E66A
mov   r1,r5                         ; 0809E66C
orr   r1,r3                         ; 0809E66E
b     @@Code0809E738                ; 0809E670
.pool                               ; 0809E672

@@Code0809E680:
mov   r2,0x0                        ; 0809E680
cmp   r0,0x4                        ; 0809E682
bne   @@Code0809E688                ; 0809E684
mov   r2,0x1                        ; 0809E686
@@Code0809E688:
cmp   r2,0x0                        ; 0809E688
bne   @@Code0809E6D4                ; 0809E68A
mov   r2,0x0                        ; 0809E68C
cmp   r0,0x2                        ; 0809E68E
bne   @@Code0809E694                ; 0809E690
mov   r2,0x1                        ; 0809E692
@@Code0809E694:
cmp   r2,0x0                        ; 0809E694
beq   @@Code0809E69E                ; 0809E696
mov   r4,0x0                        ; 0809E698
mov   r5,0x0                        ; 0809E69A
b     @@Code0809E73C                ; 0809E69C
@@Code0809E69E:
mov   r0,r5                         ; 0809E69E
orr   r0,r4                         ; 0809E6A0
cmp   r0,0x0                        ; 0809E6A2
beq   @@Code0809E73C                ; 0809E6A4
ldr   r2,[r1,0x8]                   ; 0809E6A6
ldr   r0,=0xFFFFFC02                ; 0809E6A8
cmp   r2,r0                         ; 0809E6AA
bge   @@Code0809E6CE                ; 0809E6AC
sub   r2,r0,r2                      ; 0809E6AE
cmp   r2,0x38                       ; 0809E6B0
ble   @@Code0809E6C0                ; 0809E6B2
mov   r4,0x0                        ; 0809E6B4
mov   r5,0x0                        ; 0809E6B6
b     @@Code0809E72E                ; 0809E6B8
.pool                               ; 0809E6BA

@@Code0809E6C0:
mov   r1,r5                         ; 0809E6C0
mov   r0,r4                         ; 0809E6C2
bl    Sub0809FD30                   ; 0809E6C4
mov   r5,r1                         ; 0809E6C8
mov   r4,r0                         ; 0809E6CA
b     @@Code0809E72E                ; 0809E6CC
@@Code0809E6CE:
ldr   r0,=0x03FF                    ; 0809E6CE
cmp   r2,r0                         ; 0809E6D0
ble   @@Code0809E6E4                ; 0809E6D2
@@Code0809E6D4:
ldr   r6,=0x07FF                    ; 0809E6D4
mov   r4,0x0                        ; 0809E6D6
mov   r5,0x0                        ; 0809E6D8
b     @@Code0809E73C                ; 0809E6DA
.pool                               ; 0809E6DC

@@Code0809E6E4:
ldr   r0,=0x03FF                    ; 0809E6E4
add   r6,r2,r0                      ; 0809E6E6
mov   r0,0xFF                       ; 0809E6E8
mov   r1,r4                         ; 0809E6EA
and   r1,r0                         ; 0809E6EC
mov   r2,0x0                        ; 0809E6EE
cmp   r1,0x80                       ; 0809E6F0
bne   @@Code0809E710                ; 0809E6F2
cmp   r2,0x0                        ; 0809E6F4
bne   @@Code0809E710                ; 0809E6F6
add   r0,0x1                        ; 0809E6F8
mov   r1,r4                         ; 0809E6FA
and   r1,r0                         ; 0809E6FC
mov   r0,r2                         ; 0809E6FE
orr   r0,r1                         ; 0809E700
cmp   r0,0x0                        ; 0809E702
beq   @@Code0809E718                ; 0809E704
mov   r0,0x80                       ; 0809E706
mov   r1,0x0                        ; 0809E708
b     @@Code0809E714                ; 0809E70A
.pool                               ; 0809E70C

@@Code0809E710:
mov   r0,0x7F                       ; 0809E710
mov   r1,0x0                        ; 0809E712
@@Code0809E714:
add   r4,r4,r0                      ; 0809E714
adc   r5,r1                         ; 0809E716
@@Code0809E718:
ldr   r0,=0x1FFFFFFF                ; 0809E718
cmp   r5,r0                         ; 0809E71A
bls   @@Code0809E72E                ; 0809E71C
lsl   r3,r5,0x1F                    ; 0809E71E
lsr   r2,r4,0x1                     ; 0809E720
mov   r0,r3                         ; 0809E722
orr   r0,r2                         ; 0809E724
lsr   r1,r5,0x1                     ; 0809E726
mov   r5,r1                         ; 0809E728
mov   r4,r0                         ; 0809E72A
add   r6,0x1                        ; 0809E72C
@@Code0809E72E:
lsl   r3,r5,0x18                    ; 0809E72E
lsr   r2,r4,0x8                     ; 0809E730
mov   r0,r3                         ; 0809E732
orr   r0,r2                         ; 0809E734
lsr   r1,r5,0x8                     ; 0809E736
@@Code0809E738:
mov   r5,r1                         ; 0809E738
mov   r4,r0                         ; 0809E73A
@@Code0809E73C:
str   r4,[sp]                       ; 0809E73C
ldr   r2,=0x000FFFFF                ; 0809E73E
and   r2,r5                         ; 0809E740
ldr   r0,[sp,0x4]                   ; 0809E742
ldr   r1,=0xFFF00000                ; 0809E744
and   r0,r1                         ; 0809E746
orr   r0,r2                         ; 0809E748
str   r0,[sp,0x4]                   ; 0809E74A
mov   r2,sp                         ; 0809E74C
ldr   r1,=0x07FF                    ; 0809E74E
mov   r0,r1                         ; 0809E750
and   r6,r0                         ; 0809E752
lsl   r1,r6,0x4                     ; 0809E754
ldr   r0,=0xFFFF800F                ; 0809E756
ldrh  r3,[r2,0x6]                   ; 0809E758
and   r0,r3                         ; 0809E75A
orr   r0,r1                         ; 0809E75C
strh  r0,[r2,0x6]                   ; 0809E75E
lsl   r1,r7,0x7                     ; 0809E760
mov   r0,0x7F                       ; 0809E762
ldrb  r3,[r2,0x7]                   ; 0809E764
and   r0,r3                         ; 0809E766
orr   r0,r1                         ; 0809E768
strb  r0,[r2,0x7]                   ; 0809E76A
ldr   r1,[sp]                       ; 0809E76C
ldr   r0,[sp,0x4]                   ; 0809E76E
str   r0,[sp]                       ; 0809E770
str   r1,[sp,0x4]                   ; 0809E772
ldr   r0,[sp]                       ; 0809E774
ldr   r1,[sp,0x4]                   ; 0809E776
add   sp,0x8                        ; 0809E778
pop   {r4-r7,pc}                    ; 0809E77A
.pool                               ; 0809E77C

Sub0809E790:
push  {r4-r7,lr}                    ; 0809E790
add   sp,-0x8                       ; 0809E792
mov   r2,r0                         ; 0809E794
mov   r6,r1                         ; 0809E796
ldr   r1,[r2,0x4]                   ; 0809E798
str   r1,[sp]                       ; 0809E79A
ldr   r0,[r2]                       ; 0809E79C
str   r0,[sp,0x4]                   ; 0809E79E
mov   r2,sp                         ; 0809E7A0
mov   r4,r1                         ; 0809E7A2
lsl   r0,r0,0xC                     ; 0809E7A4
lsr   r5,r0,0xC                     ; 0809E7A6
ldrh  r3,[r2,0x6]                   ; 0809E7A8
lsl   r0,r3,0x11                    ; 0809E7AA
lsr   r3,r0,0x15                    ; 0809E7AC
ldrb  r2,[r2,0x7]                   ; 0809E7AE
lsr   r0,r2,0x7                     ; 0809E7B0
str   r0,[r6,0x4]                   ; 0809E7B2
cmp   r3,0x0                        ; 0809E7B4
bne   @@Code0809E804                ; 0809E7B6
orr   r1,r5                         ; 0809E7B8
cmp   r1,0x0                        ; 0809E7BA
bne   @@Code0809E7C4                ; 0809E7BC
mov   r0,0x2                        ; 0809E7BE
str   r0,[r6]                       ; 0809E7C0
b     @@Code0809E858                ; 0809E7C2
@@Code0809E7C4:
ldr   r0,=0xFFFFFC02                ; 0809E7C4
str   r0,[r6,0x8]                   ; 0809E7C6
lsr   r3,r4,0x18                    ; 0809E7C8
lsl   r2,r5,0x8                     ; 0809E7CA
mov   r1,r3                         ; 0809E7CC
orr   r1,r2                         ; 0809E7CE
lsl   r0,r4,0x8                     ; 0809E7D0
mov   r5,r1                         ; 0809E7D2
mov   r4,r0                         ; 0809E7D4
mov   r0,0x3                        ; 0809E7D6
str   r0,[r6]                       ; 0809E7D8
ldr   r0,=0x0FFFFFFF                ; 0809E7DA
cmp   r5,r0                         ; 0809E7DC
bhi   @@Code0809E834                ; 0809E7DE
mov   r7,r0                         ; 0809E7E0
@@Code0809E7E2:
lsr   r3,r4,0x1F                    ; 0809E7E2
lsl   r2,r5,0x1                     ; 0809E7E4
mov   r1,r3                         ; 0809E7E6
orr   r1,r2                         ; 0809E7E8
lsl   r0,r4,0x1                     ; 0809E7EA
mov   r5,r1                         ; 0809E7EC
mov   r4,r0                         ; 0809E7EE
ldr   r0,[r6,0x8]                   ; 0809E7F0
sub   r0,0x1                        ; 0809E7F2
str   r0,[r6,0x8]                   ; 0809E7F4
cmp   r5,r7                         ; 0809E7F6
bls   @@Code0809E7E2                ; 0809E7F8
b     @@Code0809E834                ; 0809E7FA
.pool                               ; 0809E7FC

@@Code0809E804:
ldr   r0,=0x07FF                    ; 0809E804
cmp   r3,r0                         ; 0809E806
bne   @@Code0809E83A                ; 0809E808
orr   r1,r5                         ; 0809E80A
cmp   r1,0x0                        ; 0809E80C
bne   @@Code0809E81C                ; 0809E80E
mov   r0,0x4                        ; 0809E810
str   r0,[r6]                       ; 0809E812
b     @@Code0809E858                ; 0809E814
.pool                               ; 0809E816

@@Code0809E81C:
mov   r2,0x80                       ; 0809E81C
lsl   r2,r2,0xC                     ; 0809E81E
mov   r0,0x0                        ; 0809E820
mov   r1,r5                         ; 0809E822
and   r1,r2                         ; 0809E824
orr   r1,r0                         ; 0809E826
cmp   r1,0x0                        ; 0809E828
beq   @@Code0809E832                ; 0809E82A
mov   r0,0x1                        ; 0809E82C
str   r0,[r6]                       ; 0809E82E
b     @@Code0809E834                ; 0809E830
@@Code0809E832:
str   r1,[r6]                       ; 0809E832
@@Code0809E834:
str   r4,[r6,0xC]                   ; 0809E834
str   r5,[r6,0x10]                  ; 0809E836
b     @@Code0809E858                ; 0809E838
@@Code0809E83A:
ldr   r1,=0xFFFFFC01                ; 0809E83A
add   r0,r3,r1                      ; 0809E83C
str   r0,[r6,0x8]                   ; 0809E83E
mov   r0,0x3                        ; 0809E840
str   r0,[r6]                       ; 0809E842
lsr   r3,r4,0x18                    ; 0809E844
lsl   r2,r5,0x8                     ; 0809E846
mov   r1,r3                         ; 0809E848
orr   r1,r2                         ; 0809E84A
lsl   r0,r4,0x8                     ; 0809E84C
ldr   r2,=0x0                       ; 0809E84E
ldr   r3,=0x10000000                ; 0809E850
orr   r1,r3                         ; 0809E852
str   r0,[r6,0xC]                   ; 0809E854
str   r1,[r6,0x10]                  ; 0809E856
@@Code0809E858:
add   sp,0x8                        ; 0809E858
pop   {r4-r7,pc}                    ; 0809E85A
.pool                               ; 0809E85C

Sub0809E868:
push  {r4-r7,lr}                    ; 0809E868
mov   r7,r10                        ; 0809E86A
mov   r6,r9                         ; 0809E86C
mov   r5,r8                         ; 0809E86E
push  {r5-r7}                       ; 0809E870
add   sp,-0xC                       ; 0809E872
mov   r3,r0                         ; 0809E874
mov   r4,r1                         ; 0809E876
mov   r10,r2                        ; 0809E878
mov   r0,0x0                        ; 0809E87A
ldr   r2,[r3]                       ; 0809E87C
cmp   r2,0x1                        ; 0809E87E
bhi   @@Code0809E884                ; 0809E880
mov   r0,0x1                        ; 0809E882
@@Code0809E884:
cmp   r0,0x0                        ; 0809E884
beq   @@Code0809E88C                ; 0809E886
@@Code0809E888:
mov   r0,r3                         ; 0809E888
b     @@Code0809EAC4                ; 0809E88A
@@Code0809E88C:
mov   r1,0x0                        ; 0809E88C
ldr   r0,[r4]                       ; 0809E88E
cmp   r0,0x1                        ; 0809E890
bhi   @@Code0809E896                ; 0809E892
mov   r1,0x1                        ; 0809E894
@@Code0809E896:
cmp   r1,0x0                        ; 0809E896
bne   @@Code0809E90E                ; 0809E898
mov   r1,0x0                        ; 0809E89A
cmp   r2,0x4                        ; 0809E89C
bne   @@Code0809E8A2                ; 0809E89E
mov   r1,0x1                        ; 0809E8A0
@@Code0809E8A2:
cmp   r1,0x0                        ; 0809E8A2
beq   @@Code0809E8C4                ; 0809E8A4
mov   r1,0x0                        ; 0809E8A6
cmp   r0,0x4                        ; 0809E8A8
bne   @@Code0809E8AE                ; 0809E8AA
mov   r1,0x1                        ; 0809E8AC
@@Code0809E8AE:
cmp   r1,0x0                        ; 0809E8AE
beq   @@Code0809E888                ; 0809E8B0
ldr   r1,[r3,0x4]                   ; 0809E8B2
ldr   r0,[r4,0x4]                   ; 0809E8B4
cmp   r1,r0                         ; 0809E8B6
beq   @@Code0809E888                ; 0809E8B8
ldr   r0,=0x03002300                ; 0809E8BA
b     @@Code0809EAC4                ; 0809E8BC
.pool                               ; 0809E8BE

@@Code0809E8C4:
mov   r1,0x0                        ; 0809E8C4
cmp   r0,0x4                        ; 0809E8C6
bne   @@Code0809E8CC                ; 0809E8C8
mov   r1,0x1                        ; 0809E8CA
@@Code0809E8CC:
cmp   r1,0x0                        ; 0809E8CC
bne   @@Code0809E90E                ; 0809E8CE
mov   r1,0x0                        ; 0809E8D0
cmp   r0,0x2                        ; 0809E8D2
bne   @@Code0809E8D8                ; 0809E8D4
mov   r1,0x1                        ; 0809E8D6
@@Code0809E8D8:
cmp   r1,0x0                        ; 0809E8D8
beq   @@Code0809E900                ; 0809E8DA
mov   r0,0x0                        ; 0809E8DC
cmp   r2,0x2                        ; 0809E8DE
bne   @@Code0809E8E4                ; 0809E8E0
mov   r0,0x1                        ; 0809E8E2
@@Code0809E8E4:
cmp   r0,0x0                        ; 0809E8E4
beq   @@Code0809E888                ; 0809E8E6
mov   r1,r10                        ; 0809E8E8
mov   r0,r3                         ; 0809E8EA
ldmia r0!,{r2,r5-r6}                ; 0809E8EC
stmia r1!,{r2,r5-r6}                ; 0809E8EE
ldmia r0!,{r2,r5}                   ; 0809E8F0
stmia r1!,{r2,r5}                   ; 0809E8F2
ldr   r0,[r3,0x4]                   ; 0809E8F4
ldr   r1,[r4,0x4]                   ; 0809E8F6
and   r0,r1                         ; 0809E8F8
mov   r6,r10                        ; 0809E8FA
str   r0,[r6,0x4]                   ; 0809E8FC
b     @@Code0809EAC2                ; 0809E8FE
@@Code0809E900:
mov   r1,0x0                        ; 0809E900
ldr   r0,[r3]                       ; 0809E902
cmp   r0,0x2                        ; 0809E904
bne   @@Code0809E90A                ; 0809E906
mov   r1,0x1                        ; 0809E908
@@Code0809E90A:
cmp   r1,0x0                        ; 0809E90A
beq   @@Code0809E912                ; 0809E90C
@@Code0809E90E:
mov   r0,r4                         ; 0809E90E
b     @@Code0809EAC4                ; 0809E910
@@Code0809E912:
ldr   r0,[r3,0x8]                   ; 0809E912
mov   r9,r0                         ; 0809E914
ldr   r1,[r4,0x8]                   ; 0809E916
mov   r8,r1                         ; 0809E918
ldr   r6,[r3,0xC]                   ; 0809E91A
ldr   r7,[r3,0x10]                  ; 0809E91C
ldr   r0,[r4,0xC]                   ; 0809E91E
ldr   r1,[r4,0x10]                  ; 0809E920
str   r0,[sp]                       ; 0809E922
str   r1,[sp,0x4]                   ; 0809E924
mov   r1,r9                         ; 0809E926
mov   r2,r8                         ; 0809E928
sub   r0,r1,r2                      ; 0809E92A
cmp   r0,0x0                        ; 0809E92C
bge   @@Code0809E932                ; 0809E92E
neg   r0,r0                         ; 0809E930
@@Code0809E932:
cmp   r0,0x3F                       ; 0809E932
bgt   @@Code0809E9B0                ; 0809E934
ldr   r3,[r3,0x4]                   ; 0809E936
mov   r12,r3                        ; 0809E938
ldr   r4,[r4,0x4]                   ; 0809E93A
str   r4,[sp,0x8]                   ; 0809E93C
cmp   r9,r8                         ; 0809E93E
ble   @@Code0809E97C                ; 0809E940
mov   r3,r9                         ; 0809E942
mov   r4,r8                         ; 0809E944
sub   r3,r3,r4                      ; 0809E946
mov   r8,r3                         ; 0809E948
@@Code0809E94A:
mov   r5,0x1                        ; 0809E94A
neg   r5,r5                         ; 0809E94C
add   r8,r5                         ; 0809E94E
ldr   r2,[sp]                       ; 0809E950
mov   r0,0x1                        ; 0809E952
and   r2,r0                         ; 0809E954
mov   r3,0x0                        ; 0809E956
ldr   r1,[sp,0x4]                   ; 0809E958
lsl   r5,r1,0x1F                    ; 0809E95A
ldr   r0,[sp]                       ; 0809E95C
lsr   r4,r0,0x1                     ; 0809E95E
mov   r0,r5                         ; 0809E960
orr   r0,r4                         ; 0809E962
mov   r4,r1                         ; 0809E964
lsr   r1,r4,0x1                     ; 0809E966
mov   r5,r2                         ; 0809E968
orr   r5,r0                         ; 0809E96A
str   r5,[sp]                       ; 0809E96C
mov   r4,r3                         ; 0809E96E
orr   r4,r1                         ; 0809E970
str   r4,[sp,0x4]                   ; 0809E972
mov   r5,r8                         ; 0809E974
cmp   r5,0x0                        ; 0809E976
bne   @@Code0809E94A                ; 0809E978
mov   r8,r9                         ; 0809E97A
@@Code0809E97C:
cmp   r8,r9                         ; 0809E97C
ble   @@Code0809E9CC                ; 0809E97E
mov   r0,r8                         ; 0809E980
mov   r1,r9                         ; 0809E982
sub   r0,r0,r1                      ; 0809E984
mov   r9,r0                         ; 0809E986
@@Code0809E988:
mov   r2,0x1                        ; 0809E988
neg   r2,r2                         ; 0809E98A
add   r9,r2                         ; 0809E98C
mov   r2,0x1                        ; 0809E98E
and   r2,r6                         ; 0809E990
mov   r3,0x0                        ; 0809E992
lsl   r5,r7,0x1F                    ; 0809E994
lsr   r4,r6,0x1                     ; 0809E996
mov   r0,r5                         ; 0809E998
orr   r0,r4                         ; 0809E99A
lsr   r1,r7,0x1                     ; 0809E99C
mov   r6,r2                         ; 0809E99E
orr   r6,r0                         ; 0809E9A0
mov   r7,r3                         ; 0809E9A2
orr   r7,r1                         ; 0809E9A4
mov   r3,r9                         ; 0809E9A6
cmp   r3,0x0                        ; 0809E9A8
bne   @@Code0809E988                ; 0809E9AA
mov   r9,r8                         ; 0809E9AC
b     @@Code0809E9CC                ; 0809E9AE
@@Code0809E9B0:
cmp   r9,r8                         ; 0809E9B0
ble   @@Code0809E9BE                ; 0809E9B2
mov   r0,0x0                        ; 0809E9B4
mov   r1,0x0                        ; 0809E9B6
str   r0,[sp]                       ; 0809E9B8
str   r1,[sp,0x4]                   ; 0809E9BA
b     @@Code0809E9C4                ; 0809E9BC
@@Code0809E9BE:
mov   r9,r8                         ; 0809E9BE
mov   r6,0x0                        ; 0809E9C0
mov   r7,0x0                        ; 0809E9C2
@@Code0809E9C4:
ldr   r3,[r3,0x4]                   ; 0809E9C4
mov   r12,r3                        ; 0809E9C6
ldr   r4,[r4,0x4]                   ; 0809E9C8
str   r4,[sp,0x8]                   ; 0809E9CA
@@Code0809E9CC:
ldr   r1,[sp,0x8]                   ; 0809E9CC
cmp   r12,r1                        ; 0809E9CE
beq   @@Code0809EA74                ; 0809E9D0
mov   r2,r12                        ; 0809E9D2
cmp   r2,0x0                        ; 0809E9D4
beq   @@Code0809E9EE                ; 0809E9D6
mov   r1,r7                         ; 0809E9D8
mov   r0,r6                         ; 0809E9DA
bl    Sub0809FDD4                   ; 0809E9DC
mov   r3,r1                         ; 0809E9E0
mov   r2,r0                         ; 0809E9E2
ldr   r4,[sp]                       ; 0809E9E4
ldr   r5,[sp,0x4]                   ; 0809E9E6
add   r2,r2,r4                      ; 0809E9E8
adc   r3,r5                         ; 0809E9EA
b     @@Code0809E9FA                ; 0809E9EC
@@Code0809E9EE:
mov   r3,r7                         ; 0809E9EE
mov   r2,r6                         ; 0809E9F0
ldr   r0,[sp]                       ; 0809E9F2
ldr   r1,[sp,0x4]                   ; 0809E9F4
sub   r2,r2,r0                      ; 0809E9F6
sbc   r3,r1                         ; 0809E9F8
@@Code0809E9FA:
cmp   r3,0x0                        ; 0809E9FA
blt   @@Code0809EA10                ; 0809E9FC
mov   r0,0x0                        ; 0809E9FE
mov   r1,r10                        ; 0809EA00
str   r0,[r1,0x4]                   ; 0809EA02
mov   r4,r9                         ; 0809EA04
str   r4,[r1,0x8]                   ; 0809EA06
mov   r5,r10                        ; 0809EA08
str   r2,[r5,0xC]                   ; 0809EA0A
str   r3,[r5,0x10]                  ; 0809EA0C
b     @@Code0809EA28                ; 0809EA0E
@@Code0809EA10:
mov   r0,0x1                        ; 0809EA10
mov   r6,r10                        ; 0809EA12
str   r0,[r6,0x4]                   ; 0809EA14
mov   r0,r9                         ; 0809EA16
str   r0,[r6,0x8]                   ; 0809EA18
mov   r1,r3                         ; 0809EA1A
mov   r0,r2                         ; 0809EA1C
bl    Sub0809FDD4                   ; 0809EA1E
mov   r2,r10                        ; 0809EA22
str   r0,[r2,0xC]                   ; 0809EA24
str   r1,[r2,0x10]                  ; 0809EA26
@@Code0809EA28:
mov   r4,r10                        ; 0809EA28
ldr   r2,[r4,0xC]                   ; 0809EA2A
ldr   r3,[r4,0x10]                  ; 0809EA2C
mov   r0,0x1                        ; 0809EA2E
neg   r0,r0                         ; 0809EA30
asr   r1,r0,0x1F                    ; 0809EA32
@@Code0809EA34:
add   r2,r2,r0                      ; 0809EA34
adc   r3,r1                         ; 0809EA36
ldr   r0,=0x0FFFFFFF                ; 0809EA38
cmp   r3,r0                         ; 0809EA3A
bhi   @@Code0809EA8C                ; 0809EA3C
cmp   r3,r0                         ; 0809EA3E
bne   @@Code0809EA4A                ; 0809EA40
mov   r0,0x2                        ; 0809EA42
neg   r0,r0                         ; 0809EA44
cmp   r2,r0                         ; 0809EA46
bhi   @@Code0809EA8C                ; 0809EA48
@@Code0809EA4A:
mov   r5,r10                        ; 0809EA4A
ldr   r0,[r5,0xC]                   ; 0809EA4C
ldr   r1,[r5,0x10]                  ; 0809EA4E
lsr   r3,r0,0x1F                    ; 0809EA50
lsl   r2,r1,0x1                     ; 0809EA52
mov   r1,r3                         ; 0809EA54
orr   r1,r2                         ; 0809EA56
lsl   r0,r0,0x1                     ; 0809EA58
mov   r6,r10                        ; 0809EA5A
str   r0,[r6,0xC]                   ; 0809EA5C
str   r1,[r6,0x10]                  ; 0809EA5E
ldr   r2,[r6,0x8]                   ; 0809EA60
sub   r2,0x1                        ; 0809EA62
str   r2,[r6,0x8]                   ; 0809EA64
mov   r2,0x1                        ; 0809EA66
neg   r2,r2                         ; 0809EA68
asr   r3,r2,0x1F                    ; 0809EA6A
b     @@Code0809EA34                ; 0809EA6C
.pool                               ; 0809EA6E

@@Code0809EA74:
mov   r0,r12                        ; 0809EA74
mov   r1,r10                        ; 0809EA76
str   r0,[r1,0x4]                   ; 0809EA78
mov   r2,r9                         ; 0809EA7A
str   r2,[r1,0x8]                   ; 0809EA7C
ldr   r3,[sp]                       ; 0809EA7E
ldr   r4,[sp,0x4]                   ; 0809EA80
add   r6,r6,r3                      ; 0809EA82
adc   r7,r4                         ; 0809EA84
mov   r4,r10                        ; 0809EA86
str   r6,[r4,0xC]                   ; 0809EA88
str   r7,[r4,0x10]                  ; 0809EA8A
@@Code0809EA8C:
mov   r0,0x3                        ; 0809EA8C
mov   r5,r10                        ; 0809EA8E
str   r0,[r5]                       ; 0809EA90
ldr   r1,[r5,0x10]                  ; 0809EA92
ldr   r0,=0x1FFFFFFF                ; 0809EA94
cmp   r1,r0                         ; 0809EA96
bls   @@Code0809EAC2                ; 0809EA98
ldr   r4,[r5,0xC]                   ; 0809EA9A
ldr   r5,[r5,0x10]                  ; 0809EA9C
mov   r2,0x1                        ; 0809EA9E
mov   r0,r4                         ; 0809EAA0
and   r0,r2                         ; 0809EAA2
mov   r1,0x0                        ; 0809EAA4
lsl   r6,r5,0x1F                    ; 0809EAA6
mov   r8,r6                         ; 0809EAA8
lsr   r6,r4,0x1                     ; 0809EAAA
mov   r2,r8                         ; 0809EAAC
orr   r2,r6                         ; 0809EAAE
lsr   r3,r5,0x1                     ; 0809EAB0
orr   r0,r2                         ; 0809EAB2
orr   r1,r3                         ; 0809EAB4
mov   r2,r10                        ; 0809EAB6
str   r0,[r2,0xC]                   ; 0809EAB8
str   r1,[r2,0x10]                  ; 0809EABA
ldr   r0,[r2,0x8]                   ; 0809EABC
add   r0,0x1                        ; 0809EABE
str   r0,[r2,0x8]                   ; 0809EAC0
@@Code0809EAC2:
mov   r0,r10                        ; 0809EAC2
@@Code0809EAC4:
add   sp,0xC                        ; 0809EAC4
pop   {r3-r5}                       ; 0809EAC6
mov   r8,r3                         ; 0809EAC8
mov   r9,r4                         ; 0809EACA
mov   r10,r5                        ; 0809EACC
pop   {r4-r7,pc}                    ; 0809EACE
.pool                               ; 0809EAD0

push  {r4,lr}                       ; 0809EAD4
add   sp,-0x4C                      ; 0809EAD6
str   r0,[sp,0x3C]                  ; 0809EAD8
str   r1,[sp,0x40]                  ; 0809EADA
str   r2,[sp,0x44]                  ; 0809EADC
str   r3,[sp,0x48]                  ; 0809EADE
add   r0,sp,0x3C                    ; 0809EAE0
mov   r1,sp                         ; 0809EAE2
bl    Sub0809E790                   ; 0809EAE4
add   r0,sp,0x44                    ; 0809EAE8
add   r4,sp,0x14                    ; 0809EAEA
mov   r1,r4                         ; 0809EAEC
bl    Sub0809E790                   ; 0809EAEE
add   r2,sp,0x28                    ; 0809EAF2
mov   r0,sp                         ; 0809EAF4
mov   r1,r4                         ; 0809EAF6
bl    Sub0809E868                   ; 0809EAF8
bl    Sub0809E648                   ; 0809EAFC
add   sp,0x4C                       ; 0809EB00
pop   {r4,pc}                       ; 0809EB02

push  {r4,lr}                       ; 0809EB04
add   sp,-0x4C                      ; 0809EB06
str   r0,[sp,0x3C]                  ; 0809EB08
str   r1,[sp,0x40]                  ; 0809EB0A
str   r2,[sp,0x44]                  ; 0809EB0C
str   r3,[sp,0x48]                  ; 0809EB0E
add   r0,sp,0x3C                    ; 0809EB10
mov   r1,sp                         ; 0809EB12
bl    Sub0809E790                   ; 0809EB14
add   r0,sp,0x44                    ; 0809EB18
add   r4,sp,0x14                    ; 0809EB1A
mov   r1,r4                         ; 0809EB1C
bl    Sub0809E790                   ; 0809EB1E
ldr   r0,[r4,0x4]                   ; 0809EB22
mov   r1,0x1                        ; 0809EB24
eor   r0,r1                         ; 0809EB26
str   r0,[r4,0x4]                   ; 0809EB28
add   r2,sp,0x28                    ; 0809EB2A
mov   r0,sp                         ; 0809EB2C
mov   r1,r4                         ; 0809EB2E
bl    Sub0809E868                   ; 0809EB30
bl    Sub0809E648                   ; 0809EB34
add   sp,0x4C                       ; 0809EB38
pop   {r4,pc}                       ; 0809EB3A

push  {r4-r7,lr}                    ; 0809EB3C
mov   r7,r10                        ; 0809EB3E
mov   r6,r9                         ; 0809EB40
mov   r5,r8                         ; 0809EB42
push  {r5-r7}                       ; 0809EB44
add   sp,-0x74                      ; 0809EB46
str   r0,[sp,0x3C]                  ; 0809EB48
str   r1,[sp,0x40]                  ; 0809EB4A
str   r2,[sp,0x44]                  ; 0809EB4C
str   r3,[sp,0x48]                  ; 0809EB4E
add   r0,sp,0x3C                    ; 0809EB50
mov   r1,sp                         ; 0809EB52
bl    Sub0809E790                   ; 0809EB54
add   r0,sp,0x44                    ; 0809EB58
add   r4,sp,0x14                    ; 0809EB5A
mov   r1,r4                         ; 0809EB5C
bl    Sub0809E790                   ; 0809EB5E
mov   r8,sp                         ; 0809EB62
add   r0,sp,0x28                    ; 0809EB64
mov   r10,r0                        ; 0809EB66
mov   r0,0x0                        ; 0809EB68
ldr   r1,[sp]                       ; 0809EB6A
cmp   r1,0x1                        ; 0809EB6C
bhi   @@Code0809EB72                ; 0809EB6E
mov   r0,0x1                        ; 0809EB70
@@Code0809EB72:
cmp   r0,0x0                        ; 0809EB72
bne   @@Code0809EBD6                ; 0809EB74
mov   r2,0x0                        ; 0809EB76
ldr   r0,[sp,0x14]                  ; 0809EB78
cmp   r0,0x1                        ; 0809EB7A
bhi   @@Code0809EB80                ; 0809EB7C
mov   r2,0x1                        ; 0809EB7E
@@Code0809EB80:
cmp   r2,0x0                        ; 0809EB80
beq   @@Code0809EB88                ; 0809EB82
ldr   r0,[sp,0x4]                   ; 0809EB84
b     @@Code0809EBF8                ; 0809EB86
@@Code0809EB88:
mov   r2,0x0                        ; 0809EB88
cmp   r1,0x4                        ; 0809EB8A
bne   @@Code0809EB90                ; 0809EB8C
mov   r2,0x1                        ; 0809EB8E
@@Code0809EB90:
cmp   r2,0x0                        ; 0809EB90
beq   @@Code0809EBA2                ; 0809EB92
mov   r1,0x0                        ; 0809EB94
cmp   r0,0x2                        ; 0809EB96
bne   @@Code0809EB9C                ; 0809EB98
mov   r1,0x1                        ; 0809EB9A
@@Code0809EB9C:
cmp   r1,0x0                        ; 0809EB9C
bne   @@Code0809EBBA                ; 0809EB9E
b     @@Code0809EBD6                ; 0809EBA0
@@Code0809EBA2:
mov   r2,0x0                        ; 0809EBA2
cmp   r0,0x4                        ; 0809EBA4
bne   @@Code0809EBAA                ; 0809EBA6
mov   r2,0x1                        ; 0809EBA8
@@Code0809EBAA:
cmp   r2,0x0                        ; 0809EBAA
beq   @@Code0809EBCA                ; 0809EBAC
mov   r0,0x0                        ; 0809EBAE
cmp   r1,0x2                        ; 0809EBB0
bne   @@Code0809EBB6                ; 0809EBB2
mov   r0,0x1                        ; 0809EBB4
@@Code0809EBB6:
cmp   r0,0x0                        ; 0809EBB6
beq   @@Code0809EBC4                ; 0809EBB8
@@Code0809EBBA:
ldr   r0,=0x03002300                ; 0809EBBA
b     @@Code0809EDC2                ; 0809EBBC
.pool                               ; 0809EBBE

@@Code0809EBC4:
mov   r1,r8                         ; 0809EBC4
ldr   r0,[r1,0x4]                   ; 0809EBC6
b     @@Code0809EBF8                ; 0809EBC8
@@Code0809EBCA:
mov   r2,0x0                        ; 0809EBCA
cmp   r1,0x2                        ; 0809EBCC
bne   @@Code0809EBD2                ; 0809EBCE
mov   r2,0x1                        ; 0809EBD0
@@Code0809EBD2:
cmp   r2,0x0                        ; 0809EBD2
beq   @@Code0809EBE8                ; 0809EBD4
@@Code0809EBD6:
ldr   r0,[sp,0x4]                   ; 0809EBD6
ldr   r1,[sp,0x18]                  ; 0809EBD8
eor   r0,r1                         ; 0809EBDA
neg   r1,r0                         ; 0809EBDC
orr   r1,r0                         ; 0809EBDE
lsr   r1,r1,0x1F                    ; 0809EBE0
str   r1,[sp,0x4]                   ; 0809EBE2
mov   r0,sp                         ; 0809EBE4
b     @@Code0809EDC2                ; 0809EBE6
@@Code0809EBE8:
mov   r1,0x0                        ; 0809EBE8
cmp   r0,0x2                        ; 0809EBEA
bne   @@Code0809EBF0                ; 0809EBEC
mov   r1,0x1                        ; 0809EBEE
@@Code0809EBF0:
cmp   r1,0x0                        ; 0809EBF0
beq   @@Code0809EC08                ; 0809EBF2
mov   r2,r8                         ; 0809EBF4
ldr   r0,[r2,0x4]                   ; 0809EBF6
@@Code0809EBF8:
ldr   r1,[sp,0x18]                  ; 0809EBF8
eor   r0,r1                         ; 0809EBFA
neg   r1,r0                         ; 0809EBFC
orr   r1,r0                         ; 0809EBFE
lsr   r1,r1,0x1F                    ; 0809EC00
str   r1,[sp,0x18]                  ; 0809EC02
mov   r0,r4                         ; 0809EC04
b     @@Code0809EDC2                ; 0809EC06
@@Code0809EC08:
mov   r4,r8                         ; 0809EC08
ldr   r0,[r4,0xC]                   ; 0809EC0A
ldr   r1,[r4,0x10]                  ; 0809EC0C
mov   r6,r0                         ; 0809EC0E
mov   r7,0x0                        ; 0809EC10
str   r1,[sp,0x4C]                  ; 0809EC12
mov   r5,0x0                        ; 0809EC14
str   r5,[sp,0x50]                  ; 0809EC16
ldr   r0,[sp,0x20]                  ; 0809EC18
ldr   r1,[sp,0x24]                  ; 0809EC1A
mov   r4,r0                         ; 0809EC1C
str   r1,[sp,0x54]                  ; 0809EC1E
mov   r0,0x0                        ; 0809EC20
str   r0,[sp,0x58]                  ; 0809EC22
mov   r1,r5                         ; 0809EC24
mov   r0,r4                         ; 0809EC26
mov   r3,r7                         ; 0809EC28
mov   r2,r6                         ; 0809EC2A
bl    Sub0809FD64                   ; 0809EC2C
str   r0,[sp,0x5C]                  ; 0809EC30
str   r1,[sp,0x60]                  ; 0809EC32
ldr   r0,[sp,0x54]                  ; 0809EC34
ldr   r1,[sp,0x58]                  ; 0809EC36
mov   r3,r7                         ; 0809EC38
mov   r2,r6                         ; 0809EC3A
bl    Sub0809FD64                   ; 0809EC3C
mov   r7,r1                         ; 0809EC40
mov   r6,r0                         ; 0809EC42
mov   r1,r5                         ; 0809EC44
mov   r0,r4                         ; 0809EC46
ldr   r2,[sp,0x4C]                  ; 0809EC48
ldr   r3,[sp,0x50]                  ; 0809EC4A
bl    Sub0809FD64                   ; 0809EC4C
mov   r5,r1                         ; 0809EC50
mov   r4,r0                         ; 0809EC52
ldr   r0,[sp,0x54]                  ; 0809EC54
ldr   r1,[sp,0x58]                  ; 0809EC56
ldr   r2,[sp,0x4C]                  ; 0809EC58
ldr   r3,[sp,0x50]                  ; 0809EC5A
bl    Sub0809FD64                   ; 0809EC5C
str   r0,[sp,0x64]                  ; 0809EC60
str   r1,[sp,0x68]                  ; 0809EC62
mov   r1,0x0                        ; 0809EC64
mov   r2,0x0                        ; 0809EC66
str   r1,[sp,0x6C]                  ; 0809EC68
str   r2,[sp,0x70]                  ; 0809EC6A
mov   r3,r7                         ; 0809EC6C
mov   r2,r6                         ; 0809EC6E
add   r2,r2,r4                      ; 0809EC70
adc   r3,r5                         ; 0809EC72
cmp   r7,r3                         ; 0809EC74
bhi   @@Code0809EC80                ; 0809EC76
cmp   r7,r3                         ; 0809EC78
bne   @@Code0809EC88                ; 0809EC7A
cmp   r6,r2                         ; 0809EC7C
bls   @@Code0809EC88                ; 0809EC7E
@@Code0809EC80:
ldr   r5,=0x1                       ; 0809EC80
ldr   r4,[@@Pool_0x0]               ; 0809EC82
str   r4,[sp,0x6C]                  ; 0809EC84
str   r5,[sp,0x70]                  ; 0809EC86
@@Code0809EC88:
mov   r1,r2                         ; 0809EC88
mov   r6,0x0                        ; 0809EC8A
mov   r7,r1                         ; 0809EC8C
ldr   r0,[sp,0x5C]                  ; 0809EC8E
ldr   r1,[sp,0x60]                  ; 0809EC90
add   r6,r6,r0                      ; 0809EC92
adc   r7,r1                         ; 0809EC94
cmp   r1,r7                         ; 0809EC96
bhi   @@Code0809ECA4                ; 0809EC98
ldr   r1,[sp,0x60]                  ; 0809EC9A
cmp   r1,r7                         ; 0809EC9C
bne   @@Code0809ECB4                ; 0809EC9E
cmp   r0,r6                         ; 0809ECA0
bls   @@Code0809ECB4                ; 0809ECA2
@@Code0809ECA4:
mov   r0,0x1                        ; 0809ECA4
mov   r1,0x0                        ; 0809ECA6
ldr   r4,[sp,0x6C]                  ; 0809ECA8
ldr   r5,[sp,0x70]                  ; 0809ECAA
add   r4,r4,r0                      ; 0809ECAC
adc   r5,r1                         ; 0809ECAE
str   r4,[sp,0x6C]                  ; 0809ECB0
str   r5,[sp,0x70]                  ; 0809ECB2
@@Code0809ECB4:
mov   r0,r3                         ; 0809ECB4
mov   r2,r0                         ; 0809ECB6
mov   r3,0x0                        ; 0809ECB8
mov   r5,r3                         ; 0809ECBA
mov   r4,r2                         ; 0809ECBC
ldr   r0,[sp,0x64]                  ; 0809ECBE
ldr   r1,[sp,0x68]                  ; 0809ECC0
add   r4,r4,r0                      ; 0809ECC2
adc   r5,r1                         ; 0809ECC4
ldr   r1,[sp,0x6C]                  ; 0809ECC6
ldr   r2,[sp,0x70]                  ; 0809ECC8
add   r4,r4,r1                      ; 0809ECCA
adc   r5,r2                         ; 0809ECCC
mov   r0,r8                         ; 0809ECCE
ldr   r2,[r0,0x8]                   ; 0809ECD0
ldr   r0,[sp,0x1C]                  ; 0809ECD2
add   r2,r2,r0                      ; 0809ECD4
str   r2,[sp,0x30]                  ; 0809ECD6
mov   r0,r8                         ; 0809ECD8
ldr   r1,[r0,0x4]                   ; 0809ECDA
ldr   r0,[sp,0x18]                  ; 0809ECDC
eor   r1,r0                         ; 0809ECDE
neg   r0,r1                         ; 0809ECE0
orr   r0,r1                         ; 0809ECE2
lsr   r0,r0,0x1F                    ; 0809ECE4
str   r0,[sp,0x2C]                  ; 0809ECE6
add   r2,0x4                        ; 0809ECE8
str   r2,[sp,0x30]                  ; 0809ECEA
ldr   r0,=0x1FFFFFFF                ; 0809ECEC
cmp   r5,r0                         ; 0809ECEE
bls   @@Code0809ED36                ; 0809ECF0
mov   r1,0x1                        ; 0809ECF2
mov   r9,r1                         ; 0809ECF4
mov   r8,r0                         ; 0809ECF6
mov   r12,r2                        ; 0809ECF8
@@Code0809ECFA:
mov   r2,0x1                        ; 0809ECFA
add   r12,r2                        ; 0809ECFC
mov   r0,r9                         ; 0809ECFE
and   r0,r4                         ; 0809ED00
cmp   r0,0x0                        ; 0809ED02
beq   @@Code0809ED20                ; 0809ED04
lsl   r3,r7,0x1F                    ; 0809ED06
lsr   r2,r6,0x1                     ; 0809ED08
mov   r0,r3                         ; 0809ED0A
orr   r0,r2                         ; 0809ED0C
lsr   r1,r7,0x1                     ; 0809ED0E
mov   r7,r1                         ; 0809ED10
mov   r6,r0                         ; 0809ED12
mov   r0,r6                         ; 0809ED14
mov   r1,0x80                       ; 0809ED16
lsl   r1,r1,0x18                    ; 0809ED18
orr   r1,r7                         ; 0809ED1A
mov   r7,r1                         ; 0809ED1C
mov   r6,r0                         ; 0809ED1E
@@Code0809ED20:
lsl   r3,r5,0x1F                    ; 0809ED20
lsr   r2,r4,0x1                     ; 0809ED22
mov   r0,r3                         ; 0809ED24
orr   r0,r2                         ; 0809ED26
lsr   r1,r5,0x1                     ; 0809ED28
mov   r5,r1                         ; 0809ED2A
mov   r4,r0                         ; 0809ED2C
cmp   r5,r8                         ; 0809ED2E
bhi   @@Code0809ECFA                ; 0809ED30
mov   r0,r12                        ; 0809ED32
str   r0,[sp,0x30]                  ; 0809ED34
@@Code0809ED36:
ldr   r0,=0x0FFFFFFF                ; 0809ED36
cmp   r5,r0                         ; 0809ED38
bhi   @@Code0809ED88                ; 0809ED3A
mov   r1,0x80                       ; 0809ED3C
lsl   r1,r1,0x18                    ; 0809ED3E
mov   r9,r1                         ; 0809ED40
mov   r8,r0                         ; 0809ED42
ldr   r2,[sp,0x30]                  ; 0809ED44
mov   r12,r2                        ; 0809ED46
@@Code0809ED48:
mov   r0,0x1                        ; 0809ED48
neg   r0,r0                         ; 0809ED4A
add   r12,r0                        ; 0809ED4C
lsr   r3,r4,0x1F                    ; 0809ED4E
lsl   r2,r5,0x1                     ; 0809ED50
mov   r1,r3                         ; 0809ED52
orr   r1,r2                         ; 0809ED54
lsl   r0,r4,0x1                     ; 0809ED56
mov   r5,r1                         ; 0809ED58
mov   r4,r0                         ; 0809ED5A
mov   r0,0x0                        ; 0809ED5C
mov   r1,r9                         ; 0809ED5E
and   r1,r7                         ; 0809ED60
orr   r0,r1                         ; 0809ED62
cmp   r0,0x0                        ; 0809ED64
beq   @@Code0809ED72                ; 0809ED66
mov   r0,0x1                        ; 0809ED68
orr   r0,r4                         ; 0809ED6A
mov   r1,r5                         ; 0809ED6C
mov   r5,r1                         ; 0809ED6E
mov   r4,r0                         ; 0809ED70
@@Code0809ED72:
lsr   r3,r6,0x1F                    ; 0809ED72
lsl   r2,r7,0x1                     ; 0809ED74
mov   r1,r3                         ; 0809ED76
orr   r1,r2                         ; 0809ED78
lsl   r0,r6,0x1                     ; 0809ED7A
mov   r7,r1                         ; 0809ED7C
mov   r6,r0                         ; 0809ED7E
cmp   r5,r8                         ; 0809ED80
bls   @@Code0809ED48                ; 0809ED82
mov   r1,r12                        ; 0809ED84
str   r1,[sp,0x30]                  ; 0809ED86
@@Code0809ED88:
mov   r0,0xFF                       ; 0809ED88
mov   r1,r4                         ; 0809ED8A
and   r1,r0                         ; 0809ED8C
mov   r2,0x0                        ; 0809ED8E
cmp   r1,0x80                       ; 0809ED90
bne   @@Code0809EDB6                ; 0809ED92
cmp   r2,0x0                        ; 0809ED94
bne   @@Code0809EDB6                ; 0809ED96
add   r0,0x1                        ; 0809ED98
mov   r1,r4                         ; 0809ED9A
and   r1,r0                         ; 0809ED9C
mov   r0,r2                         ; 0809ED9E
orr   r0,r1                         ; 0809EDA0
cmp   r0,0x0                        ; 0809EDA2
bne   @@Code0809EDAE                ; 0809EDA4
mov   r0,r7                         ; 0809EDA6
orr   r0,r6                         ; 0809EDA8
cmp   r0,0x0                        ; 0809EDAA
beq   @@Code0809EDB6                ; 0809EDAC
@@Code0809EDAE:
mov   r0,0x80                       ; 0809EDAE
mov   r1,0x0                        ; 0809EDB0
add   r4,r4,r0                      ; 0809EDB2
adc   r5,r1                         ; 0809EDB4
@@Code0809EDB6:
str   r4,[sp,0x34]                  ; 0809EDB6
str   r5,[sp,0x38]                  ; 0809EDB8
mov   r0,0x3                        ; 0809EDBA
mov   r2,r10                        ; 0809EDBC
str   r0,[r2]                       ; 0809EDBE
add   r0,sp,0x28                    ; 0809EDC0
@@Code0809EDC2:
bl    Sub0809E648                   ; 0809EDC2
add   sp,0x74                       ; 0809EDC6
pop   {r3-r5}                       ; 0809EDC8
mov   r8,r3                         ; 0809EDCA
mov   r9,r4                         ; 0809EDCC
mov   r10,r5                        ; 0809EDCE
pop   {r4-r7,pc}                    ; 0809EDD0
.align 4
@@Pool_0x0:
.d32 0x0                            ; 0809EDD4
.pool                               ; 0809EDD8

push  {r4-r7,lr}                    ; 0809EDE4
add   sp,-0x48                      ; 0809EDE6
str   r0,[sp,0x28]                  ; 0809EDE8
str   r1,[sp,0x2C]                  ; 0809EDEA
str   r2,[sp,0x30]                  ; 0809EDEC
str   r3,[sp,0x34]                  ; 0809EDEE
add   r0,sp,0x28                    ; 0809EDF0
mov   r1,sp                         ; 0809EDF2
bl    Sub0809E790                   ; 0809EDF4
add   r0,sp,0x30                    ; 0809EDF8
add   r4,sp,0x14                    ; 0809EDFA
mov   r1,r4                         ; 0809EDFC
bl    Sub0809E790                   ; 0809EDFE
mov   r12,sp                        ; 0809EE02
mov   r0,0x0                        ; 0809EE04
ldr   r3,[sp]                       ; 0809EE06
cmp   r3,0x1                        ; 0809EE08
bhi   @@Code0809EE0E                ; 0809EE0A
mov   r0,0x1                        ; 0809EE0C
@@Code0809EE0E:
cmp   r0,0x0                        ; 0809EE0E
beq   @@Code0809EE16                ; 0809EE10
mov   r1,sp                         ; 0809EE12
b     @@Code0809EF58                ; 0809EE14
@@Code0809EE16:
mov   r0,0x0                        ; 0809EE16
ldr   r2,[sp,0x14]                  ; 0809EE18
mov   r5,r2                         ; 0809EE1A
cmp   r2,0x1                        ; 0809EE1C
bhi   @@Code0809EE22                ; 0809EE1E
mov   r0,0x1                        ; 0809EE20
@@Code0809EE22:
cmp   r0,0x0                        ; 0809EE22
beq   @@Code0809EE2A                ; 0809EE24
mov   r1,r4                         ; 0809EE26
b     @@Code0809EF58                ; 0809EE28
@@Code0809EE2A:
ldr   r0,[sp,0x4]                   ; 0809EE2A
ldr   r1,[sp,0x18]                  ; 0809EE2C
eor   r0,r1                         ; 0809EE2E
str   r0,[sp,0x4]                   ; 0809EE30
mov   r0,0x0                        ; 0809EE32
cmp   r3,0x4                        ; 0809EE34
bne   @@Code0809EE3A                ; 0809EE36
mov   r0,0x1                        ; 0809EE38
@@Code0809EE3A:
cmp   r0,0x0                        ; 0809EE3A
bne   @@Code0809EE4A                ; 0809EE3C
mov   r4,0x0                        ; 0809EE3E
cmp   r3,0x2                        ; 0809EE40
bne   @@Code0809EE46                ; 0809EE42
mov   r4,0x1                        ; 0809EE44
@@Code0809EE46:
cmp   r4,0x0                        ; 0809EE46
beq   @@Code0809EE5C                ; 0809EE48
@@Code0809EE4A:
mov   r1,r12                        ; 0809EE4A
ldr   r0,[r1]                       ; 0809EE4C
cmp   r0,r5                         ; 0809EE4E
beq   @@Code0809EE54                ; 0809EE50
b     @@Code0809EF58                ; 0809EE52
@@Code0809EE54:
ldr   r1,=0x03002300                ; 0809EE54
b     @@Code0809EF58                ; 0809EE56
.pool                               ; 0809EE58

@@Code0809EE5C:
mov   r0,0x0                        ; 0809EE5C
cmp   r2,0x4                        ; 0809EE5E
bne   @@Code0809EE64                ; 0809EE60
mov   r0,0x1                        ; 0809EE62
@@Code0809EE64:
cmp   r0,0x0                        ; 0809EE64
beq   @@Code0809EE76                ; 0809EE66
mov   r0,0x0                        ; 0809EE68
mov   r1,0x0                        ; 0809EE6A
str   r0,[sp,0xC]                   ; 0809EE6C
str   r1,[sp,0x10]                  ; 0809EE6E
str   r4,[sp,0x8]                   ; 0809EE70
mov   r1,sp                         ; 0809EE72
b     @@Code0809EF58                ; 0809EE74
@@Code0809EE76:
mov   r0,0x0                        ; 0809EE76
cmp   r2,0x2                        ; 0809EE78
bne   @@Code0809EE7E                ; 0809EE7A
mov   r0,0x1                        ; 0809EE7C
@@Code0809EE7E:
cmp   r0,0x0                        ; 0809EE7E
beq   @@Code0809EE8A                ; 0809EE80
mov   r0,0x4                        ; 0809EE82
mov   r2,r12                        ; 0809EE84
str   r0,[r2]                       ; 0809EE86
b     @@Code0809EF56                ; 0809EE88
@@Code0809EE8A:
mov   r3,r12                        ; 0809EE8A
ldr   r1,[r3,0x8]                   ; 0809EE8C
ldr   r0,[sp,0x1C]                  ; 0809EE8E
sub   r6,r1,r0                      ; 0809EE90
str   r6,[r3,0x8]                   ; 0809EE92
ldr   r4,[r3,0xC]                   ; 0809EE94
ldr   r5,[r3,0x10]                  ; 0809EE96
ldr   r0,[sp,0x20]                  ; 0809EE98
ldr   r1,[sp,0x24]                  ; 0809EE9A
str   r0,[sp,0x38]                  ; 0809EE9C
str   r1,[sp,0x3C]                  ; 0809EE9E
cmp   r1,r5                         ; 0809EEA0
bhi   @@Code0809EEAE                ; 0809EEA2
ldr   r1,[sp,0x3C]                  ; 0809EEA4
cmp   r1,r5                         ; 0809EEA6
bne   @@Code0809EEC2                ; 0809EEA8
cmp   r0,r4                         ; 0809EEAA
bls   @@Code0809EEC2                ; 0809EEAC
@@Code0809EEAE:
lsr   r3,r4,0x1F                    ; 0809EEAE
lsl   r2,r5,0x1                     ; 0809EEB0
mov   r1,r3                         ; 0809EEB2
orr   r1,r2                         ; 0809EEB4
lsl   r0,r4,0x1                     ; 0809EEB6
mov   r5,r1                         ; 0809EEB8
mov   r4,r0                         ; 0809EEBA
sub   r0,r6,0x1                     ; 0809EEBC
mov   r2,r12                        ; 0809EEBE
str   r0,[r2,0x8]                   ; 0809EEC0
@@Code0809EEC2:
ldr   r7,[@@Pool_0x10000000]        ; 0809EEC2
ldr   r6,=0x0                       ; 0809EEC4
mov   r0,0x0                        ; 0809EEC6
mov   r1,0x0                        ; 0809EEC8
str   r0,[sp,0x40]                  ; 0809EECA
str   r1,[sp,0x44]                  ; 0809EECC
@@Code0809EECE:
ldr   r1,[sp,0x3C]                  ; 0809EECE
cmp   r1,r5                         ; 0809EED0
bhi   @@Code0809EEF2                ; 0809EED2
cmp   r1,r5                         ; 0809EED4
bne   @@Code0809EEDE                ; 0809EED6
ldr   r2,[sp,0x38]                  ; 0809EED8
cmp   r2,r4                         ; 0809EEDA
bhi   @@Code0809EEF2                ; 0809EEDC
@@Code0809EEDE:
ldr   r0,[sp,0x40]                  ; 0809EEDE
orr   r0,r6                         ; 0809EEE0
ldr   r1,[sp,0x44]                  ; 0809EEE2
orr   r1,r7                         ; 0809EEE4
str   r0,[sp,0x40]                  ; 0809EEE6
str   r1,[sp,0x44]                  ; 0809EEE8
ldr   r0,[sp,0x38]                  ; 0809EEEA
ldr   r1,[sp,0x3C]                  ; 0809EEEC
sub   r4,r4,r0                      ; 0809EEEE
sbc   r5,r1                         ; 0809EEF0
@@Code0809EEF2:
lsl   r3,r7,0x1F                    ; 0809EEF2
lsr   r2,r6,0x1                     ; 0809EEF4
mov   r0,r3                         ; 0809EEF6
orr   r0,r2                         ; 0809EEF8
lsr   r1,r7,0x1                     ; 0809EEFA
mov   r7,r1                         ; 0809EEFC
mov   r6,r0                         ; 0809EEFE
lsr   r3,r4,0x1F                    ; 0809EF00
lsl   r2,r5,0x1                     ; 0809EF02
mov   r1,r3                         ; 0809EF04
orr   r1,r2                         ; 0809EF06
lsl   r0,r4,0x1                     ; 0809EF08
mov   r5,r1                         ; 0809EF0A
mov   r4,r0                         ; 0809EF0C
mov   r0,r7                         ; 0809EF0E
orr   r0,r6                         ; 0809EF10
cmp   r0,0x0                        ; 0809EF12
bne   @@Code0809EECE                ; 0809EF14
mov   r0,0xFF                       ; 0809EF16
ldr   r1,[sp,0x40]                  ; 0809EF18
and   r1,r0                         ; 0809EF1A
mov   r2,0x0                        ; 0809EF1C
cmp   r1,0x80                       ; 0809EF1E
bne   @@Code0809EF4C                ; 0809EF20
cmp   r2,0x0                        ; 0809EF22
bne   @@Code0809EF4C                ; 0809EF24
add   r0,0x1                        ; 0809EF26
ldr   r1,[sp,0x40]                  ; 0809EF28
and   r1,r0                         ; 0809EF2A
mov   r0,r2                         ; 0809EF2C
orr   r0,r1                         ; 0809EF2E
cmp   r0,0x0                        ; 0809EF30
bne   @@Code0809EF3C                ; 0809EF32
mov   r0,r5                         ; 0809EF34
orr   r0,r4                         ; 0809EF36
cmp   r0,0x0                        ; 0809EF38
beq   @@Code0809EF4C                ; 0809EF3A
@@Code0809EF3C:
mov   r0,0x80                       ; 0809EF3C
mov   r1,0x0                        ; 0809EF3E
ldr   r2,[sp,0x40]                  ; 0809EF40
ldr   r3,[sp,0x44]                  ; 0809EF42
add   r2,r2,r0                      ; 0809EF44
adc   r3,r1                         ; 0809EF46
str   r2,[sp,0x40]                  ; 0809EF48
str   r3,[sp,0x44]                  ; 0809EF4A
@@Code0809EF4C:
ldr   r0,[sp,0x40]                  ; 0809EF4C
ldr   r1,[sp,0x44]                  ; 0809EF4E
mov   r2,r12                        ; 0809EF50
str   r0,[r2,0xC]                   ; 0809EF52
str   r1,[r2,0x10]                  ; 0809EF54
@@Code0809EF56:
mov   r1,r12                        ; 0809EF56
@@Code0809EF58:
mov   r0,r1                         ; 0809EF58
bl    Sub0809E648                   ; 0809EF5A
add   sp,0x48                       ; 0809EF5E
pop   {r4-r7,pc}                    ; 0809EF60
.pool                               ; 0809EF62
@@Pool_0x10000000:
.d32 0x10000000                     ; 0809EF68

Sub0809EF6C:
push  {r4-r6,lr}                    ; 0809EF6C
mov   r5,r0                         ; 0809EF6E
mov   r6,r1                         ; 0809EF70
mov   r0,0x0                        ; 0809EF72
ldr   r1,[r5]                       ; 0809EF74
cmp   r1,0x1                        ; 0809EF76
bhi   @@Code0809EF7C                ; 0809EF78
mov   r0,0x1                        ; 0809EF7A
@@Code0809EF7C:
cmp   r0,0x0                        ; 0809EF7C
bne   @@Code0809EF8E                ; 0809EF7E
mov   r0,0x0                        ; 0809EF80
ldr   r2,[r6]                       ; 0809EF82
cmp   r2,0x1                        ; 0809EF84
bhi   @@Code0809EF8A                ; 0809EF86
mov   r0,0x1                        ; 0809EF88
@@Code0809EF8A:
cmp   r0,0x0                        ; 0809EF8A
beq   @@Code0809EF92                ; 0809EF8C
@@Code0809EF8E:
mov   r0,0x1                        ; 0809EF8E
b     @@Code0809F068                ; 0809EF90
@@Code0809EF92:
mov   r0,0x0                        ; 0809EF92
cmp   r1,0x4                        ; 0809EF94
bne   @@Code0809EF9A                ; 0809EF96
mov   r0,0x1                        ; 0809EF98
@@Code0809EF9A:
cmp   r0,0x0                        ; 0809EF9A
beq   @@Code0809EFB2                ; 0809EF9C
mov   r0,0x0                        ; 0809EF9E
cmp   r2,0x4                        ; 0809EFA0
bne   @@Code0809EFA6                ; 0809EFA2
mov   r0,0x1                        ; 0809EFA4
@@Code0809EFA6:
cmp   r0,0x0                        ; 0809EFA6
beq   @@Code0809EFB2                ; 0809EFA8
ldr   r0,[r6,0x4]                   ; 0809EFAA
ldr   r1,[r5,0x4]                   ; 0809EFAC
sub   r0,r0,r1                      ; 0809EFAE
b     @@Code0809F068                ; 0809EFB0
@@Code0809EFB2:
mov   r1,0x0                        ; 0809EFB2
ldr   r0,[r5]                       ; 0809EFB4
cmp   r0,0x4                        ; 0809EFB6
bne   @@Code0809EFBC                ; 0809EFB8
mov   r1,0x1                        ; 0809EFBA
@@Code0809EFBC:
cmp   r1,0x0                        ; 0809EFBC
bne   @@Code0809F00A                ; 0809EFBE
mov   r1,0x0                        ; 0809EFC0
cmp   r2,0x4                        ; 0809EFC2
bne   @@Code0809EFC8                ; 0809EFC4
mov   r1,0x1                        ; 0809EFC6
@@Code0809EFC8:
cmp   r1,0x0                        ; 0809EFC8
beq   @@Code0809EFDA                ; 0809EFCA
@@Code0809EFCC:
ldr   r0,[r6,0x4]                   ; 0809EFCC
mov   r1,0x1                        ; 0809EFCE
neg   r1,r1                         ; 0809EFD0
cmp   r0,0x0                        ; 0809EFD2
beq   @@Code0809F014                ; 0809EFD4
mov   r1,0x1                        ; 0809EFD6
b     @@Code0809F014                ; 0809EFD8
@@Code0809EFDA:
mov   r1,0x0                        ; 0809EFDA
cmp   r0,0x2                        ; 0809EFDC
bne   @@Code0809EFE2                ; 0809EFDE
mov   r1,0x1                        ; 0809EFE0
@@Code0809EFE2:
cmp   r1,0x0                        ; 0809EFE2
beq   @@Code0809EFF2                ; 0809EFE4
mov   r1,0x0                        ; 0809EFE6
cmp   r2,0x2                        ; 0809EFE8
bne   @@Code0809EFEE                ; 0809EFEA
mov   r1,0x1                        ; 0809EFEC
@@Code0809EFEE:
cmp   r1,0x0                        ; 0809EFEE
bne   @@Code0809F066                ; 0809EFF0
@@Code0809EFF2:
mov   r1,0x0                        ; 0809EFF2
cmp   r0,0x2                        ; 0809EFF4
bne   @@Code0809EFFA                ; 0809EFF6
mov   r1,0x1                        ; 0809EFF8
@@Code0809EFFA:
cmp   r1,0x0                        ; 0809EFFA
bne   @@Code0809EFCC                ; 0809EFFC
mov   r0,0x0                        ; 0809EFFE
cmp   r2,0x2                        ; 0809F000
bne   @@Code0809F006                ; 0809F002
mov   r0,0x1                        ; 0809F004
@@Code0809F006:
cmp   r0,0x0                        ; 0809F006
beq   @@Code0809F018                ; 0809F008
@@Code0809F00A:
ldr   r0,[r5,0x4]                   ; 0809F00A
mov   r1,0x1                        ; 0809F00C
cmp   r0,0x0                        ; 0809F00E
beq   @@Code0809F014                ; 0809F010
sub   r1,0x2                        ; 0809F012
@@Code0809F014:
mov   r0,r1                         ; 0809F014
b     @@Code0809F068                ; 0809F016
@@Code0809F018:
ldr   r0,[r6,0x4]                   ; 0809F018
ldr   r4,[r5,0x4]                   ; 0809F01A
cmp   r4,r0                         ; 0809F01C
beq   @@Code0809F02A                ; 0809F01E
@@Code0809F020:
mov   r0,0x1                        ; 0809F020
cmp   r4,0x0                        ; 0809F022
beq   @@Code0809F068                ; 0809F024
sub   r0,0x2                        ; 0809F026
b     @@Code0809F068                ; 0809F028
@@Code0809F02A:
ldr   r1,[r5,0x8]                   ; 0809F02A
ldr   r0,[r6,0x8]                   ; 0809F02C
cmp   r1,r0                         ; 0809F02E
bgt   @@Code0809F020                ; 0809F030
cmp   r1,r0                         ; 0809F032
bge   @@Code0809F042                ; 0809F034
@@Code0809F036:
mov   r0,0x1                        ; 0809F036
neg   r0,r0                         ; 0809F038
cmp   r4,0x0                        ; 0809F03A
beq   @@Code0809F068                ; 0809F03C
mov   r0,0x1                        ; 0809F03E
b     @@Code0809F068                ; 0809F040
@@Code0809F042:
ldr   r3,[r5,0x10]                  ; 0809F042
ldr   r2,[r6,0x10]                  ; 0809F044
cmp   r3,r2                         ; 0809F046
bhi   @@Code0809F020                ; 0809F048
cmp   r3,r2                         ; 0809F04A
bne   @@Code0809F056                ; 0809F04C
ldr   r1,[r5,0xC]                   ; 0809F04E
ldr   r0,[r6,0xC]                   ; 0809F050
cmp   r1,r0                         ; 0809F052
bhi   @@Code0809F020                ; 0809F054
@@Code0809F056:
cmp   r2,r3                         ; 0809F056
bhi   @@Code0809F036                ; 0809F058
cmp   r2,r3                         ; 0809F05A
bne   @@Code0809F066                ; 0809F05C
ldr   r1,[r6,0xC]                   ; 0809F05E
ldr   r0,[r5,0xC]                   ; 0809F060
cmp   r1,r0                         ; 0809F062
bhi   @@Code0809F036                ; 0809F064
@@Code0809F066:
mov   r0,0x0                        ; 0809F066
@@Code0809F068:
pop   {r4-r6,pc}                    ; 0809F068
.pool                               ; 0809F06A

push  {r4,lr}                       ; 0809F06C
add   sp,-0x38                      ; 0809F06E
str   r0,[sp,0x28]                  ; 0809F070
str   r1,[sp,0x2C]                  ; 0809F072
str   r2,[sp,0x30]                  ; 0809F074
str   r3,[sp,0x34]                  ; 0809F076
add   r0,sp,0x28                    ; 0809F078
mov   r1,sp                         ; 0809F07A
bl    Sub0809E790                   ; 0809F07C
add   r0,sp,0x30                    ; 0809F080
add   r4,sp,0x14                    ; 0809F082
mov   r1,r4                         ; 0809F084
bl    Sub0809E790                   ; 0809F086
mov   r0,sp                         ; 0809F08A
mov   r1,r4                         ; 0809F08C
bl    Sub0809EF6C                   ; 0809F08E
add   sp,0x38                       ; 0809F092
pop   {r4,pc}                       ; 0809F094
.pool                               ; 0809F096

push  {r4,lr}                       ; 0809F098
add   sp,-0x38                      ; 0809F09A
str   r0,[sp,0x28]                  ; 0809F09C
str   r1,[sp,0x2C]                  ; 0809F09E
str   r2,[sp,0x30]                  ; 0809F0A0
str   r3,[sp,0x34]                  ; 0809F0A2
add   r0,sp,0x28                    ; 0809F0A4
mov   r1,sp                         ; 0809F0A6
bl    Sub0809E790                   ; 0809F0A8
add   r0,sp,0x30                    ; 0809F0AC
add   r4,sp,0x14                    ; 0809F0AE
mov   r1,r4                         ; 0809F0B0
bl    Sub0809E790                   ; 0809F0B2
mov   r1,0x0                        ; 0809F0B6
ldr   r0,[sp]                       ; 0809F0B8
cmp   r0,0x1                        ; 0809F0BA
bhi   @@Code0809F0C0                ; 0809F0BC
mov   r1,0x1                        ; 0809F0BE
@@Code0809F0C0:
cmp   r1,0x0                        ; 0809F0C0
bne   @@Code0809F0D2                ; 0809F0C2
mov   r1,0x0                        ; 0809F0C4
ldr   r0,[sp,0x14]                  ; 0809F0C6
cmp   r0,0x1                        ; 0809F0C8
bhi   @@Code0809F0CE                ; 0809F0CA
mov   r1,0x1                        ; 0809F0CC
@@Code0809F0CE:
cmp   r1,0x0                        ; 0809F0CE
beq   @@Code0809F0D6                ; 0809F0D0
@@Code0809F0D2:
mov   r0,0x1                        ; 0809F0D2
b     @@Code0809F0DE                ; 0809F0D4
@@Code0809F0D6:
mov   r0,sp                         ; 0809F0D6
mov   r1,r4                         ; 0809F0D8
bl    Sub0809EF6C                   ; 0809F0DA
@@Code0809F0DE:
add   sp,0x38                       ; 0809F0DE
pop   {r4,pc}                       ; 0809F0E0
.pool                               ; 0809F0E2

push  {r4,lr}                       ; 0809F0E4
add   sp,-0x38                      ; 0809F0E6
str   r0,[sp,0x28]                  ; 0809F0E8
str   r1,[sp,0x2C]                  ; 0809F0EA
str   r2,[sp,0x30]                  ; 0809F0EC
str   r3,[sp,0x34]                  ; 0809F0EE
add   r0,sp,0x28                    ; 0809F0F0
mov   r1,sp                         ; 0809F0F2
bl    Sub0809E790                   ; 0809F0F4
add   r0,sp,0x30                    ; 0809F0F8
add   r4,sp,0x14                    ; 0809F0FA
mov   r1,r4                         ; 0809F0FC
bl    Sub0809E790                   ; 0809F0FE
mov   r1,0x0                        ; 0809F102
ldr   r0,[sp]                       ; 0809F104
cmp   r0,0x1                        ; 0809F106
bhi   @@Code0809F10C                ; 0809F108
mov   r1,0x1                        ; 0809F10A
@@Code0809F10C:
cmp   r1,0x0                        ; 0809F10C
bne   @@Code0809F11E                ; 0809F10E
mov   r1,0x0                        ; 0809F110
ldr   r0,[sp,0x14]                  ; 0809F112
cmp   r0,0x1                        ; 0809F114
bhi   @@Code0809F11A                ; 0809F116
mov   r1,0x1                        ; 0809F118
@@Code0809F11A:
cmp   r1,0x0                        ; 0809F11A
beq   @@Code0809F122                ; 0809F11C
@@Code0809F11E:
mov   r0,0x1                        ; 0809F11E
b     @@Code0809F12A                ; 0809F120
@@Code0809F122:
mov   r0,sp                         ; 0809F122
mov   r1,r4                         ; 0809F124
bl    Sub0809EF6C                   ; 0809F126
@@Code0809F12A:
add   sp,0x38                       ; 0809F12A
pop   {r4,pc}                       ; 0809F12C
.pool                               ; 0809F12E

push  {r4,lr}                       ; 0809F130
add   sp,-0x38                      ; 0809F132
str   r0,[sp,0x28]                  ; 0809F134
str   r1,[sp,0x2C]                  ; 0809F136
str   r2,[sp,0x30]                  ; 0809F138
str   r3,[sp,0x34]                  ; 0809F13A
add   r0,sp,0x28                    ; 0809F13C
mov   r1,sp                         ; 0809F13E
bl    Sub0809E790                   ; 0809F140
add   r0,sp,0x30                    ; 0809F144
add   r4,sp,0x14                    ; 0809F146
mov   r1,r4                         ; 0809F148
bl    Sub0809E790                   ; 0809F14A
mov   r1,0x0                        ; 0809F14E
ldr   r0,[sp]                       ; 0809F150
cmp   r0,0x1                        ; 0809F152
bhi   @@Code0809F158                ; 0809F154
mov   r1,0x1                        ; 0809F156
@@Code0809F158:
cmp   r1,0x0                        ; 0809F158
bne   @@Code0809F16A                ; 0809F15A
mov   r1,0x0                        ; 0809F15C
ldr   r0,[sp,0x14]                  ; 0809F15E
cmp   r0,0x1                        ; 0809F160
bhi   @@Code0809F166                ; 0809F162
mov   r1,0x1                        ; 0809F164
@@Code0809F166:
cmp   r1,0x0                        ; 0809F166
beq   @@Code0809F170                ; 0809F168
@@Code0809F16A:
mov   r0,0x1                        ; 0809F16A
neg   r0,r0                         ; 0809F16C
b     @@Code0809F178                ; 0809F16E
@@Code0809F170:
mov   r0,sp                         ; 0809F170
mov   r1,r4                         ; 0809F172
bl    Sub0809EF6C                   ; 0809F174
@@Code0809F178:
add   sp,0x38                       ; 0809F178
pop   {r4,pc}                       ; 0809F17A

Sub0809F17C:
push  {r4,lr}                       ; 0809F17C
add   sp,-0x38                      ; 0809F17E
str   r0,[sp,0x28]                  ; 0809F180
str   r1,[sp,0x2C]                  ; 0809F182
str   r2,[sp,0x30]                  ; 0809F184
str   r3,[sp,0x34]                  ; 0809F186
add   r0,sp,0x28                    ; 0809F188
mov   r1,sp                         ; 0809F18A
bl    Sub0809E790                   ; 0809F18C
add   r0,sp,0x30                    ; 0809F190
add   r4,sp,0x14                    ; 0809F192
mov   r1,r4                         ; 0809F194
bl    Sub0809E790                   ; 0809F196
mov   r1,0x0                        ; 0809F19A
ldr   r0,[sp]                       ; 0809F19C
cmp   r0,0x1                        ; 0809F19E
bhi   @@Code0809F1A4                ; 0809F1A0
mov   r1,0x1                        ; 0809F1A2
@@Code0809F1A4:
cmp   r1,0x0                        ; 0809F1A4
bne   @@Code0809F1B6                ; 0809F1A6
mov   r1,0x0                        ; 0809F1A8
ldr   r0,[sp,0x14]                  ; 0809F1AA
cmp   r0,0x1                        ; 0809F1AC
bhi   @@Code0809F1B2                ; 0809F1AE
mov   r1,0x1                        ; 0809F1B0
@@Code0809F1B2:
cmp   r1,0x0                        ; 0809F1B2
beq   @@Code0809F1BC                ; 0809F1B4
@@Code0809F1B6:
mov   r0,0x1                        ; 0809F1B6
neg   r0,r0                         ; 0809F1B8
b     @@Code0809F1C4                ; 0809F1BA
@@Code0809F1BC:
mov   r0,sp                         ; 0809F1BC
mov   r1,r4                         ; 0809F1BE
bl    Sub0809EF6C                   ; 0809F1C0
@@Code0809F1C4:
add   sp,0x38                       ; 0809F1C4
pop   {r4,pc}                       ; 0809F1C6

push  {r4,lr}                       ; 0809F1C8
add   sp,-0x38                      ; 0809F1CA
str   r0,[sp,0x28]                  ; 0809F1CC
str   r1,[sp,0x2C]                  ; 0809F1CE
str   r2,[sp,0x30]                  ; 0809F1D0
str   r3,[sp,0x34]                  ; 0809F1D2
add   r0,sp,0x28                    ; 0809F1D4
mov   r1,sp                         ; 0809F1D6
bl    Sub0809E790                   ; 0809F1D8
add   r0,sp,0x30                    ; 0809F1DC
add   r4,sp,0x14                    ; 0809F1DE
mov   r1,r4                         ; 0809F1E0
bl    Sub0809E790                   ; 0809F1E2
mov   r1,0x0                        ; 0809F1E6
ldr   r0,[sp]                       ; 0809F1E8
cmp   r0,0x1                        ; 0809F1EA
bhi   @@Code0809F1F0                ; 0809F1EC
mov   r1,0x1                        ; 0809F1EE
@@Code0809F1F0:
cmp   r1,0x0                        ; 0809F1F0
bne   @@Code0809F202                ; 0809F1F2
mov   r1,0x0                        ; 0809F1F4
ldr   r0,[sp,0x14]                  ; 0809F1F6
cmp   r0,0x1                        ; 0809F1F8
bhi   @@Code0809F1FE                ; 0809F1FA
mov   r1,0x1                        ; 0809F1FC
@@Code0809F1FE:
cmp   r1,0x0                        ; 0809F1FE
beq   @@Code0809F206                ; 0809F200
@@Code0809F202:
mov   r0,0x1                        ; 0809F202
b     @@Code0809F20E                ; 0809F204
@@Code0809F206:
mov   r0,sp                         ; 0809F206
mov   r1,r4                         ; 0809F208
bl    Sub0809EF6C                   ; 0809F20A
@@Code0809F20E:
add   sp,0x38                       ; 0809F20E
pop   {r4,pc}                       ; 0809F210
.pool                               ; 0809F212

push  {r4,lr}                       ; 0809F214
add   sp,-0x38                      ; 0809F216
str   r0,[sp,0x28]                  ; 0809F218
str   r1,[sp,0x2C]                  ; 0809F21A
str   r2,[sp,0x30]                  ; 0809F21C
str   r3,[sp,0x34]                  ; 0809F21E
add   r0,sp,0x28                    ; 0809F220
mov   r1,sp                         ; 0809F222
bl    Sub0809E790                   ; 0809F224
add   r0,sp,0x30                    ; 0809F228
add   r4,sp,0x14                    ; 0809F22A
mov   r1,r4                         ; 0809F22C
bl    Sub0809E790                   ; 0809F22E
mov   r1,0x0                        ; 0809F232
ldr   r0,[sp]                       ; 0809F234
cmp   r0,0x1                        ; 0809F236
bhi   @@Code0809F23C                ; 0809F238
mov   r1,0x1                        ; 0809F23A
@@Code0809F23C:
cmp   r1,0x0                        ; 0809F23C
bne   @@Code0809F24E                ; 0809F23E
mov   r1,0x0                        ; 0809F240
ldr   r0,[sp,0x14]                  ; 0809F242
cmp   r0,0x1                        ; 0809F244
bhi   @@Code0809F24A                ; 0809F246
mov   r1,0x1                        ; 0809F248
@@Code0809F24A:
cmp   r1,0x0                        ; 0809F24A
beq   @@Code0809F252                ; 0809F24C
@@Code0809F24E:
mov   r0,0x1                        ; 0809F24E
b     @@Code0809F25A                ; 0809F250
@@Code0809F252:
mov   r0,sp                         ; 0809F252
mov   r1,r4                         ; 0809F254
bl    Sub0809EF6C                   ; 0809F256
@@Code0809F25A:
add   sp,0x38                       ; 0809F25A
pop   {r4,pc}                       ; 0809F25C
.pool                               ; 0809F25E

Sub0809F260:
push  {r4-r5,lr}                    ; 0809F260
add   sp,-0x14                      ; 0809F262
mov   r2,r0                         ; 0809F264
mov   r0,0x3                        ; 0809F266
str   r0,[sp]                       ; 0809F268
lsr   r1,r2,0x1F                    ; 0809F26A
str   r1,[sp,0x4]                   ; 0809F26C
cmp   r2,0x0                        ; 0809F26E
bne   @@Code0809F278                ; 0809F270
mov   r0,0x2                        ; 0809F272
str   r0,[sp]                       ; 0809F274
b     @@Code0809F2CE                ; 0809F276
@@Code0809F278:
mov   r0,0x3C                       ; 0809F278
str   r0,[sp,0x8]                   ; 0809F27A
cmp   r1,0x0                        ; 0809F27C
beq   @@Code0809F29E                ; 0809F27E
mov   r0,0x80                       ; 0809F280
lsl   r0,r0,0x18                    ; 0809F282
cmp   r2,r0                         ; 0809F284
bne   @@Code0809F298                ; 0809F286
ldr   r1,[@@Pool_0x0]               ; 0809F288
ldr   r0,=0xC1E00000                ; 0809F28A
b     @@Code0809F2D4                ; 0809F28C
.pool                               ; 0809F28E
@@Pool_0x0:
.d32 0x0                            ; 0809F294

@@Code0809F298:
neg   r0,r2                         ; 0809F298
asr   r1,r0,0x1F                    ; 0809F29A
b     @@Code0809F2A2                ; 0809F29C
@@Code0809F29E:
mov   r0,r2                         ; 0809F29E
asr   r1,r2,0x1F                    ; 0809F2A0
@@Code0809F2A2:
str   r0,[sp,0xC]                   ; 0809F2A2
str   r1,[sp,0x10]                  ; 0809F2A4
ldr   r0,[sp,0x10]                  ; 0809F2A6
ldr   r1,=0x0FFFFFFF                ; 0809F2A8
cmp   r0,r1                         ; 0809F2AA
bhi   @@Code0809F2CE                ; 0809F2AC
mov   r5,r1                         ; 0809F2AE
ldr   r4,[sp,0x8]                   ; 0809F2B0
@@Code0809F2B2:
ldr   r0,[sp,0xC]                   ; 0809F2B2
ldr   r1,[sp,0x10]                  ; 0809F2B4
lsr   r3,r0,0x1F                    ; 0809F2B6
lsl   r2,r1,0x1                     ; 0809F2B8
mov   r1,r3                         ; 0809F2BA
orr   r1,r2                         ; 0809F2BC
lsl   r0,r0,0x1                     ; 0809F2BE
str   r0,[sp,0xC]                   ; 0809F2C0
str   r1,[sp,0x10]                  ; 0809F2C2
sub   r4,0x1                        ; 0809F2C4
ldr   r0,[sp,0x10]                  ; 0809F2C6
cmp   r0,r5                         ; 0809F2C8
bls   @@Code0809F2B2                ; 0809F2CA
str   r4,[sp,0x8]                   ; 0809F2CC
@@Code0809F2CE:
mov   r0,sp                         ; 0809F2CE
bl    Sub0809E648                   ; 0809F2D0
@@Code0809F2D4:
add   sp,0x14                       ; 0809F2D4
pop   {r4-r5,pc}                    ; 0809F2D6
.pool                               ; 0809F2D8

push  {lr}                          ; 0809F2DC
add   sp,-0x1C                      ; 0809F2DE
str   r0,[sp,0x14]                  ; 0809F2E0
str   r1,[sp,0x18]                  ; 0809F2E2
add   r0,sp,0x14                    ; 0809F2E4
mov   r1,sp                         ; 0809F2E6
bl    Sub0809E790                   ; 0809F2E8
mov   r1,0x0                        ; 0809F2EC
ldr   r0,[sp]                       ; 0809F2EE
cmp   r0,0x2                        ; 0809F2F0
bne   @@Code0809F2F6                ; 0809F2F2
mov   r1,0x1                        ; 0809F2F4
@@Code0809F2F6:
cmp   r1,0x0                        ; 0809F2F6
bne   @@Code0809F32A                ; 0809F2F8
mov   r1,0x0                        ; 0809F2FA
cmp   r0,0x1                        ; 0809F2FC
bhi   @@Code0809F302                ; 0809F2FE
mov   r1,0x1                        ; 0809F300
@@Code0809F302:
cmp   r1,0x0                        ; 0809F302
bne   @@Code0809F32A                ; 0809F304
mov   r1,0x0                        ; 0809F306
cmp   r0,0x4                        ; 0809F308
bne   @@Code0809F30E                ; 0809F30A
mov   r1,0x1                        ; 0809F30C
@@Code0809F30E:
cmp   r1,0x0                        ; 0809F30E
beq   @@Code0809F324                ; 0809F310
@@Code0809F312:
ldr   r0,[sp,0x4]                   ; 0809F312
ldr   r1,=0x7FFFFFFF                ; 0809F314
cmp   r0,0x0                        ; 0809F316
beq   @@Code0809F348                ; 0809F318
add   r1,0x1                        ; 0809F31A
b     @@Code0809F348                ; 0809F31C
.pool                               ; 0809F31E

@@Code0809F324:
ldr   r0,[sp,0x8]                   ; 0809F324
cmp   r0,0x0                        ; 0809F326
bge   @@Code0809F32E                ; 0809F328
@@Code0809F32A:
mov   r0,0x0                        ; 0809F32A
b     @@Code0809F34A                ; 0809F32C
@@Code0809F32E:
cmp   r0,0x1E                       ; 0809F32E
bgt   @@Code0809F312                ; 0809F330
mov   r2,0x3C                       ; 0809F332
sub   r2,r2,r0                      ; 0809F334
ldr   r0,[sp,0xC]                   ; 0809F336
ldr   r1,[sp,0x10]                  ; 0809F338
bl    Sub0809FD30                   ; 0809F33A
mov   r1,r0                         ; 0809F33E
ldr   r0,[sp,0x4]                   ; 0809F340
cmp   r0,0x0                        ; 0809F342
beq   @@Code0809F348                ; 0809F344
neg   r1,r1                         ; 0809F346
@@Code0809F348:
mov   r0,r1                         ; 0809F348
@@Code0809F34A:
add   sp,0x1C                       ; 0809F34A
pop   {pc}                          ; 0809F34C
.pool                               ; 0809F34E

push  {lr}                          ; 0809F350
add   sp,-0x1C                      ; 0809F352
str   r0,[sp,0x14]                  ; 0809F354
str   r1,[sp,0x18]                  ; 0809F356
add   r0,sp,0x14                    ; 0809F358
mov   r1,sp                         ; 0809F35A
bl    Sub0809E790                   ; 0809F35C
mov   r1,0x0                        ; 0809F360
ldr   r0,[sp,0x4]                   ; 0809F362
cmp   r0,0x0                        ; 0809F364
bne   @@Code0809F36A                ; 0809F366
mov   r1,0x1                        ; 0809F368
@@Code0809F36A:
str   r1,[sp,0x4]                   ; 0809F36A
mov   r0,sp                         ; 0809F36C
bl    Sub0809E648                   ; 0809F36E
add   sp,0x1C                       ; 0809F372
pop   {pc}                          ; 0809F374
.pool                               ; 0809F376

Sub0809F378:
add   sp,-0x4                       ; 0809F378
push  {r4,lr}                       ; 0809F37A
add   sp,-0x14                      ; 0809F37C
str   r3,[sp,0x1C]                  ; 0809F37E
ldr   r3,[sp,0x1C]                  ; 0809F380
ldr   r4,[sp,0x20]                  ; 0809F382
str   r0,[sp]                       ; 0809F384
str   r1,[sp,0x4]                   ; 0809F386
str   r2,[sp,0x8]                   ; 0809F388
str   r3,[sp,0xC]                   ; 0809F38A
str   r4,[sp,0x10]                  ; 0809F38C
mov   r0,sp                         ; 0809F38E
bl    Sub0809E648                   ; 0809F390
add   sp,0x14                       ; 0809F394
pop   {r4}                          ; 0809F396
pop   {r3}                          ; 0809F398
add   sp,0x4                        ; 0809F39A
bx    r3                            ; 0809F39C
.pool                               ; 0809F39E

push  {r4-r5,lr}                    ; 0809F3A0
add   sp,-0x1C                      ; 0809F3A2
str   r0,[sp,0x14]                  ; 0809F3A4
str   r1,[sp,0x18]                  ; 0809F3A6
add   r0,sp,0x14                    ; 0809F3A8
mov   r1,sp                         ; 0809F3AA
bl    Sub0809E790                   ; 0809F3AC
ldr   r2,[sp,0xC]                   ; 0809F3B0
ldr   r3,[sp,0x10]                  ; 0809F3B2
lsl   r5,r3,0x2                     ; 0809F3B4
lsr   r4,r2,0x1E                    ; 0809F3B6
mov   r0,r5                         ; 0809F3B8
orr   r0,r4                         ; 0809F3BA
mov   r5,r0                         ; 0809F3BC
ldr   r4,=0x3FFFFFFF                ; 0809F3BE
mov   r0,r2                         ; 0809F3C0
and   r0,r4                         ; 0809F3C2
mov   r1,0x0                        ; 0809F3C4
orr   r0,r1                         ; 0809F3C6
cmp   r0,0x0                        ; 0809F3C8
beq   @@Code0809F3D0                ; 0809F3CA
mov   r0,0x1                        ; 0809F3CC
orr   r5,r0                         ; 0809F3CE
@@Code0809F3D0:
ldr   r0,[sp]                       ; 0809F3D0
ldr   r1,[sp,0x4]                   ; 0809F3D2
ldr   r2,[sp,0x8]                   ; 0809F3D4
mov   r3,r5                         ; 0809F3D6
bl    Sub0809FCEC                   ; 0809F3D8
add   sp,0x1C                       ; 0809F3DC
pop   {r4-r5,pc}                    ; 0809F3DE
.pool                               ; 0809F3E0

Sub0809F3E4:
push  {r4-r6,lr}                    ; 0809F3E4
ldr   r2,[r0,0xC]                   ; 0809F3E6
ldr   r6,[r0,0x4]                   ; 0809F3E8
mov   r5,0x0                        ; 0809F3EA
mov   r1,0x0                        ; 0809F3EC
ldr   r3,[r0]                       ; 0809F3EE
cmp   r3,0x1                        ; 0809F3F0
bhi   @@Code0809F3F6                ; 0809F3F2
mov   r1,0x1                        ; 0809F3F4
@@Code0809F3F6:
cmp   r1,0x0                        ; 0809F3F6
beq   @@Code0809F404                ; 0809F3F8
mov   r5,0xFF                       ; 0809F3FA
mov   r0,0x80                       ; 0809F3FC
lsl   r0,r0,0xD                     ; 0809F3FE
orr   r2,r0                         ; 0809F400
b     @@Code0809F46A                ; 0809F402
@@Code0809F404:
mov   r1,0x0                        ; 0809F404
cmp   r3,0x4                        ; 0809F406
bne   @@Code0809F40C                ; 0809F408
mov   r1,0x1                        ; 0809F40A
@@Code0809F40C:
cmp   r1,0x0                        ; 0809F40C
bne   @@Code0809F440                ; 0809F40E
mov   r1,0x0                        ; 0809F410
cmp   r3,0x2                        ; 0809F412
bne   @@Code0809F418                ; 0809F414
mov   r1,0x1                        ; 0809F416
@@Code0809F418:
cmp   r1,0x0                        ; 0809F418
beq   @@Code0809F420                ; 0809F41A
mov   r2,0x0                        ; 0809F41C
b     @@Code0809F46A                ; 0809F41E
@@Code0809F420:
cmp   r2,0x0                        ; 0809F420
beq   @@Code0809F46A                ; 0809F422
ldr   r0,[r0,0x8]                   ; 0809F424
mov   r3,0x7E                       ; 0809F426
neg   r3,r3                         ; 0809F428
cmp   r0,r3                         ; 0809F42A
bge   @@Code0809F43C                ; 0809F42C
sub   r0,r3,r0                      ; 0809F42E
cmp   r0,0x19                       ; 0809F430
ble   @@Code0809F438                ; 0809F432
mov   r2,0x0                        ; 0809F434
b     @@Code0809F468                ; 0809F436
@@Code0809F438:
lsr   r2,r0                         ; 0809F438
b     @@Code0809F468                ; 0809F43A
@@Code0809F43C:
cmp   r0,0x7F                       ; 0809F43C
ble   @@Code0809F446                ; 0809F43E
@@Code0809F440:
mov   r5,0xFF                       ; 0809F440
mov   r2,0x0                        ; 0809F442
b     @@Code0809F46A                ; 0809F444
@@Code0809F446:
mov   r5,r0                         ; 0809F446
add   r5,0x7F                       ; 0809F448
mov   r0,0x7F                       ; 0809F44A
and   r0,r2                         ; 0809F44C
cmp   r0,0x40                       ; 0809F44E
bne   @@Code0809F45E                ; 0809F450
mov   r0,0x80                       ; 0809F452
and   r0,r2                         ; 0809F454
cmp   r0,0x0                        ; 0809F456
beq   @@Code0809F460                ; 0809F458
add   r2,0x40                       ; 0809F45A
b     @@Code0809F460                ; 0809F45C
@@Code0809F45E:
add   r2,0x3F                       ; 0809F45E
@@Code0809F460:
cmp   r2,0x0                        ; 0809F460
bge   @@Code0809F468                ; 0809F462
lsr   r2,r2,0x1                     ; 0809F464
add   r5,0x1                        ; 0809F466
@@Code0809F468:
lsr   r2,r2,0x7                     ; 0809F468
@@Code0809F46A:
ldr   r0,=0x007FFFFF                ; 0809F46A
and   r2,r0                         ; 0809F46C
ldr   r0,=0xFF800000                ; 0809F46E
and   r4,r0                         ; 0809F470
orr   r4,r2                         ; 0809F472
mov   r0,0xFF                       ; 0809F474
and   r5,r0                         ; 0809F476
lsl   r1,r5,0x17                    ; 0809F478
ldr   r0,=0x807FFFFF                ; 0809F47A
and   r4,r0                         ; 0809F47C
orr   r4,r1                         ; 0809F47E
lsl   r1,r6,0x1F                    ; 0809F480
ldr   r0,=0x7FFFFFFF                ; 0809F482
and   r4,r0                         ; 0809F484
orr   r4,r1                         ; 0809F486
mov   r0,r4                         ; 0809F488
pop   {r4-r6,pc}                    ; 0809F48A
.pool                               ; 0809F48C

Sub0809F49C:
push  {r4,lr}                       ; 0809F49C
mov   r3,r1                         ; 0809F49E
ldr   r0,[r0]                       ; 0809F4A0
lsl   r1,r0,0x9                     ; 0809F4A2
lsr   r2,r1,0x9                     ; 0809F4A4
lsl   r1,r0,0x1                     ; 0809F4A6
lsr   r1,r1,0x18                    ; 0809F4A8
lsr   r0,r0,0x1F                    ; 0809F4AA
str   r0,[r3,0x4]                   ; 0809F4AC
cmp   r1,0x0                        ; 0809F4AE
bne   @@Code0809F4E0                ; 0809F4B0
cmp   r2,0x0                        ; 0809F4B2
bne   @@Code0809F4BC                ; 0809F4B4
mov   r0,0x2                        ; 0809F4B6
str   r0,[r3]                       ; 0809F4B8
b     @@Code0809F514                ; 0809F4BA
@@Code0809F4BC:
mov   r4,r1                         ; 0809F4BC
sub   r4,0x7E                       ; 0809F4BE
str   r4,[r3,0x8]                   ; 0809F4C0
lsl   r2,r2,0x7                     ; 0809F4C2
mov   r0,0x3                        ; 0809F4C4
str   r0,[r3]                       ; 0809F4C6
ldr   r1,=0x3FFFFFFF                ; 0809F4C8
cmp   r2,r1                         ; 0809F4CA
bhi   @@Code0809F4FC                ; 0809F4CC
mov   r0,r4                         ; 0809F4CE
@@Code0809F4D0:
lsl   r2,r2,0x1                     ; 0809F4D0
sub   r0,0x1                        ; 0809F4D2
cmp   r2,r1                         ; 0809F4D4
bls   @@Code0809F4D0                ; 0809F4D6
str   r0,[r3,0x8]                   ; 0809F4D8
b     @@Code0809F4FC                ; 0809F4DA
.pool                               ; 0809F4DC

@@Code0809F4E0:
cmp   r1,0xFF                       ; 0809F4E0
bne   @@Code0809F500                ; 0809F4E2
cmp   r2,0x0                        ; 0809F4E4
bne   @@Code0809F4EE                ; 0809F4E6
mov   r0,0x4                        ; 0809F4E8
str   r0,[r3]                       ; 0809F4EA
b     @@Code0809F514                ; 0809F4EC
@@Code0809F4EE:
mov   r0,0x80                       ; 0809F4EE
lsl   r0,r0,0xD                     ; 0809F4F0
and   r0,r2                         ; 0809F4F2
cmp   r0,0x0                        ; 0809F4F4
beq   @@Code0809F4FA                ; 0809F4F6
mov   r0,0x1                        ; 0809F4F8
@@Code0809F4FA:
str   r0,[r3]                       ; 0809F4FA
@@Code0809F4FC:
str   r2,[r3,0xC]                   ; 0809F4FC
b     @@Code0809F514                ; 0809F4FE
@@Code0809F500:
mov   r0,r1                         ; 0809F500
sub   r0,0x7F                       ; 0809F502
str   r0,[r3,0x8]                   ; 0809F504
mov   r0,0x3                        ; 0809F506
str   r0,[r3]                       ; 0809F508
lsl   r0,r2,0x7                     ; 0809F50A
mov   r1,0x80                       ; 0809F50C
lsl   r1,r1,0x17                    ; 0809F50E
orr   r0,r1                         ; 0809F510
str   r0,[r3,0xC]                   ; 0809F512
@@Code0809F514:
pop   {r4,pc}                       ; 0809F514
.pool                               ; 0809F516

Sub0809F518:
push  {r4-r7,lr}                    ; 0809F518
mov   r7,r8                         ; 0809F51A
push  {r7}                          ; 0809F51C
mov   r6,r0                         ; 0809F51E
mov   r7,r1                         ; 0809F520
mov   r5,r2                         ; 0809F522
mov   r0,0x0                        ; 0809F524
ldr   r2,[r6]                       ; 0809F526
cmp   r2,0x1                        ; 0809F528
bhi   @@Code0809F52E                ; 0809F52A
mov   r0,0x1                        ; 0809F52C
@@Code0809F52E:
cmp   r0,0x0                        ; 0809F52E
beq   @@Code0809F536                ; 0809F530
@@Code0809F532:
mov   r0,r6                         ; 0809F532
b     @@Code0809F68C                ; 0809F534
@@Code0809F536:
mov   r1,0x0                        ; 0809F536
ldr   r0,[r7]                       ; 0809F538
cmp   r0,0x1                        ; 0809F53A
bhi   @@Code0809F540                ; 0809F53C
mov   r1,0x1                        ; 0809F53E
@@Code0809F540:
cmp   r1,0x0                        ; 0809F540
bne   @@Code0809F5B4                ; 0809F542
mov   r1,0x0                        ; 0809F544
cmp   r2,0x4                        ; 0809F546
bne   @@Code0809F54C                ; 0809F548
mov   r1,0x1                        ; 0809F54A
@@Code0809F54C:
cmp   r1,0x0                        ; 0809F54C
beq   @@Code0809F56C                ; 0809F54E
mov   r1,0x0                        ; 0809F550
cmp   r0,0x4                        ; 0809F552
bne   @@Code0809F558                ; 0809F554
mov   r1,0x1                        ; 0809F556
@@Code0809F558:
cmp   r1,0x0                        ; 0809F558
beq   @@Code0809F532                ; 0809F55A
ldr   r1,[r6,0x4]                   ; 0809F55C
ldr   r0,[r7,0x4]                   ; 0809F55E
cmp   r1,r0                         ; 0809F560
beq   @@Code0809F532                ; 0809F562
ldr   r0,=0x03002318                ; 0809F564
b     @@Code0809F68C                ; 0809F566
.pool                               ; 0809F568

@@Code0809F56C:
mov   r1,0x0                        ; 0809F56C
cmp   r0,0x4                        ; 0809F56E
bne   @@Code0809F574                ; 0809F570
mov   r1,0x1                        ; 0809F572
@@Code0809F574:
cmp   r1,0x0                        ; 0809F574
bne   @@Code0809F5B4                ; 0809F576
mov   r1,0x0                        ; 0809F578
cmp   r0,0x2                        ; 0809F57A
bne   @@Code0809F580                ; 0809F57C
mov   r1,0x1                        ; 0809F57E
@@Code0809F580:
cmp   r1,0x0                        ; 0809F580
beq   @@Code0809F5A6                ; 0809F582
mov   r0,0x0                        ; 0809F584
cmp   r2,0x2                        ; 0809F586
bne   @@Code0809F58C                ; 0809F588
mov   r0,0x1                        ; 0809F58A
@@Code0809F58C:
cmp   r0,0x0                        ; 0809F58C
beq   @@Code0809F532                ; 0809F58E
mov   r1,r5                         ; 0809F590
mov   r0,r6                         ; 0809F592
ldmia r0!,{r2-r4}                   ; 0809F594
stmia r1!,{r2-r4}                   ; 0809F596
ldr   r0,[r0]                       ; 0809F598
str   r0,[r1]                       ; 0809F59A
ldr   r0,[r6,0x4]                   ; 0809F59C
ldr   r1,[r7,0x4]                   ; 0809F59E
and   r0,r1                         ; 0809F5A0
str   r0,[r5,0x4]                   ; 0809F5A2
b     @@Code0809F68A                ; 0809F5A4
@@Code0809F5A6:
mov   r1,0x0                        ; 0809F5A6
ldr   r0,[r6]                       ; 0809F5A8
cmp   r0,0x2                        ; 0809F5AA
bne   @@Code0809F5B0                ; 0809F5AC
mov   r1,0x1                        ; 0809F5AE
@@Code0809F5B0:
cmp   r1,0x0                        ; 0809F5B0
beq   @@Code0809F5B8                ; 0809F5B2
@@Code0809F5B4:
mov   r0,r7                         ; 0809F5B4
b     @@Code0809F68C                ; 0809F5B6
@@Code0809F5B8:
ldr   r1,[r6,0x8]                   ; 0809F5B8
ldr   r3,[r7,0x8]                   ; 0809F5BA
ldr   r2,[r6,0xC]                   ; 0809F5BC
ldr   r4,[r7,0xC]                   ; 0809F5BE
sub   r0,r1,r3                      ; 0809F5C0
cmp   r0,0x0                        ; 0809F5C2
bge   @@Code0809F5C8                ; 0809F5C4
neg   r0,r0                         ; 0809F5C6
@@Code0809F5C8:
cmp   r0,0x1F                       ; 0809F5C8
bgt   @@Code0809F60C                ; 0809F5CA
ldr   r6,[r6,0x4]                   ; 0809F5CC
ldr   r7,[r7,0x4]                   ; 0809F5CE
mov   r8,r7                         ; 0809F5D0
cmp   r1,r3                         ; 0809F5D2
ble   @@Code0809F5EE                ; 0809F5D4
mov   r7,0x1                        ; 0809F5D6
mov   r12,r7                        ; 0809F5D8
sub   r3,r1,r3                      ; 0809F5DA
@@Code0809F5DC:
sub   r3,0x1                        ; 0809F5DC
mov   r0,r4                         ; 0809F5DE
mov   r7,r12                        ; 0809F5E0
and   r0,r7                         ; 0809F5E2
lsr   r4,r4,0x1                     ; 0809F5E4
orr   r4,r0                         ; 0809F5E6
cmp   r3,0x0                        ; 0809F5E8
bne   @@Code0809F5DC                ; 0809F5EA
mov   r3,r1                         ; 0809F5EC
@@Code0809F5EE:
cmp   r3,r1                         ; 0809F5EE
ble   @@Code0809F61E                ; 0809F5F0
mov   r0,0x1                        ; 0809F5F2
mov   r12,r0                        ; 0809F5F4
sub   r1,r3,r1                      ; 0809F5F6
@@Code0809F5F8:
sub   r1,0x1                        ; 0809F5F8
mov   r0,r2                         ; 0809F5FA
mov   r7,r12                        ; 0809F5FC
and   r0,r7                         ; 0809F5FE
lsr   r2,r2,0x1                     ; 0809F600
orr   r2,r0                         ; 0809F602
cmp   r1,0x0                        ; 0809F604
bne   @@Code0809F5F8                ; 0809F606
mov   r1,r3                         ; 0809F608
b     @@Code0809F61E                ; 0809F60A
@@Code0809F60C:
cmp   r1,r3                         ; 0809F60C
ble   @@Code0809F614                ; 0809F60E
mov   r4,0x0                        ; 0809F610
b     @@Code0809F618                ; 0809F612
@@Code0809F614:
mov   r1,r3                         ; 0809F614
mov   r2,0x0                        ; 0809F616
@@Code0809F618:
ldr   r6,[r6,0x4]                   ; 0809F618
ldr   r7,[r7,0x4]                   ; 0809F61A
mov   r8,r7                         ; 0809F61C
@@Code0809F61E:
cmp   r6,r8                         ; 0809F61E
beq   @@Code0809F668                ; 0809F620
cmp   r6,0x0                        ; 0809F622
beq   @@Code0809F62A                ; 0809F624
sub   r3,r4,r2                      ; 0809F626
b     @@Code0809F62C                ; 0809F628
@@Code0809F62A:
sub   r3,r2,r4                      ; 0809F62A
@@Code0809F62C:
cmp   r3,0x0                        ; 0809F62C
blt   @@Code0809F63A                ; 0809F62E
mov   r0,0x0                        ; 0809F630
str   r0,[r5,0x4]                   ; 0809F632
str   r1,[r5,0x8]                   ; 0809F634
str   r3,[r5,0xC]                   ; 0809F636
b     @@Code0809F644                ; 0809F638
@@Code0809F63A:
mov   r0,0x1                        ; 0809F63A
str   r0,[r5,0x4]                   ; 0809F63C
str   r1,[r5,0x8]                   ; 0809F63E
neg   r0,r3                         ; 0809F640
str   r0,[r5,0xC]                   ; 0809F642
@@Code0809F644:
ldr   r1,[r5,0xC]                   ; 0809F644
sub   r0,r1,0x1                     ; 0809F646
ldr   r2,=0x3FFFFFFE                ; 0809F648
cmp   r0,r2                         ; 0809F64A
bhi   @@Code0809F670                ; 0809F64C
@@Code0809F64E:
lsl   r0,r1,0x1                     ; 0809F64E
str   r0,[r5,0xC]                   ; 0809F650
ldr   r1,[r5,0x8]                   ; 0809F652
sub   r1,0x1                        ; 0809F654
str   r1,[r5,0x8]                   ; 0809F656
mov   r1,r0                         ; 0809F658
sub   r0,r1,0x1                     ; 0809F65A
cmp   r0,r2                         ; 0809F65C
bls   @@Code0809F64E                ; 0809F65E
b     @@Code0809F670                ; 0809F660
.pool                               ; 0809F662

@@Code0809F668:
str   r6,[r5,0x4]                   ; 0809F668
str   r1,[r5,0x8]                   ; 0809F66A
add   r0,r2,r4                      ; 0809F66C
str   r0,[r5,0xC]                   ; 0809F66E
@@Code0809F670:
mov   r0,0x3                        ; 0809F670
str   r0,[r5]                       ; 0809F672
ldr   r1,[r5,0xC]                   ; 0809F674
cmp   r1,0x0                        ; 0809F676
bge   @@Code0809F68A                ; 0809F678
mov   r0,0x1                        ; 0809F67A
and   r0,r1                         ; 0809F67C
lsr   r1,r1,0x1                     ; 0809F67E
orr   r0,r1                         ; 0809F680
str   r0,[r5,0xC]                   ; 0809F682
ldr   r0,[r5,0x8]                   ; 0809F684
add   r0,0x1                        ; 0809F686
str   r0,[r5,0x8]                   ; 0809F688
@@Code0809F68A:
mov   r0,r5                         ; 0809F68A
@@Code0809F68C:
pop   {r3}                          ; 0809F68C
mov   r8,r3                         ; 0809F68E
pop   {r4-r7,pc}                    ; 0809F690
.pool                               ; 0809F692

push  {r4,lr}                       ; 0809F694
add   sp,-0x38                      ; 0809F696
str   r0,[sp,0x30]                  ; 0809F698
str   r1,[sp,0x34]                  ; 0809F69A
add   r0,sp,0x30                    ; 0809F69C
mov   r1,sp                         ; 0809F69E
bl    Sub0809F49C                   ; 0809F6A0
add   r0,sp,0x34                    ; 0809F6A4
add   r4,sp,0x10                    ; 0809F6A6
mov   r1,r4                         ; 0809F6A8
bl    Sub0809F49C                   ; 0809F6AA
add   r2,sp,0x20                    ; 0809F6AE
mov   r0,sp                         ; 0809F6B0
mov   r1,r4                         ; 0809F6B2
bl    Sub0809F518                   ; 0809F6B4
bl    Sub0809F3E4                   ; 0809F6B8
add   sp,0x38                       ; 0809F6BC
pop   {r4,pc}                       ; 0809F6BE

push  {r4,lr}                       ; 0809F6C0
add   sp,-0x38                      ; 0809F6C2
str   r0,[sp,0x30]                  ; 0809F6C4
str   r1,[sp,0x34]                  ; 0809F6C6
add   r0,sp,0x30                    ; 0809F6C8
mov   r1,sp                         ; 0809F6CA
bl    Sub0809F49C                   ; 0809F6CC
add   r0,sp,0x34                    ; 0809F6D0
add   r4,sp,0x10                    ; 0809F6D2
mov   r1,r4                         ; 0809F6D4
bl    Sub0809F49C                   ; 0809F6D6
ldr   r0,[r4,0x4]                   ; 0809F6DA
mov   r1,0x1                        ; 0809F6DC
eor   r0,r1                         ; 0809F6DE
str   r0,[r4,0x4]                   ; 0809F6E0
add   r2,sp,0x20                    ; 0809F6E2
mov   r0,sp                         ; 0809F6E4
mov   r1,r4                         ; 0809F6E6
bl    Sub0809F518                   ; 0809F6E8
bl    Sub0809F3E4                   ; 0809F6EC
add   sp,0x38                       ; 0809F6F0
pop   {r4,pc}                       ; 0809F6F2

push  {r4-r7,lr}                    ; 0809F6F4
mov   r7,r9                         ; 0809F6F6
mov   r6,r8                         ; 0809F6F8
push  {r6-r7}                       ; 0809F6FA
add   sp,-0x38                      ; 0809F6FC
str   r0,[sp,0x30]                  ; 0809F6FE
str   r1,[sp,0x34]                  ; 0809F700
add   r0,sp,0x30                    ; 0809F702
mov   r1,sp                         ; 0809F704
bl    Sub0809F49C                   ; 0809F706
add   r0,sp,0x34                    ; 0809F70A
add   r4,sp,0x10                    ; 0809F70C
mov   r1,r4                         ; 0809F70E
bl    Sub0809F49C                   ; 0809F710
mov   r7,sp                         ; 0809F714
add   r0,sp,0x20                    ; 0809F716
mov   r8,r0                         ; 0809F718
mov   r0,0x0                        ; 0809F71A
ldr   r1,[sp]                       ; 0809F71C
mov   r9,r8                         ; 0809F71E
cmp   r1,0x1                        ; 0809F720
bhi   @@Code0809F726                ; 0809F722
mov   r0,0x1                        ; 0809F724
@@Code0809F726:
cmp   r0,0x0                        ; 0809F726
bne   @@Code0809F784                ; 0809F728
mov   r2,0x0                        ; 0809F72A
ldr   r0,[sp,0x10]                  ; 0809F72C
cmp   r0,0x1                        ; 0809F72E
bhi   @@Code0809F734                ; 0809F730
mov   r2,0x1                        ; 0809F732
@@Code0809F734:
cmp   r2,0x0                        ; 0809F734
beq   @@Code0809F73C                ; 0809F736
ldr   r0,[sp,0x4]                   ; 0809F738
b     @@Code0809F7A4                ; 0809F73A
@@Code0809F73C:
mov   r2,0x0                        ; 0809F73C
cmp   r1,0x4                        ; 0809F73E
bne   @@Code0809F744                ; 0809F740
mov   r2,0x1                        ; 0809F742
@@Code0809F744:
cmp   r2,0x0                        ; 0809F744
beq   @@Code0809F756                ; 0809F746
mov   r1,0x0                        ; 0809F748
cmp   r0,0x2                        ; 0809F74A
bne   @@Code0809F750                ; 0809F74C
mov   r1,0x1                        ; 0809F74E
@@Code0809F750:
cmp   r1,0x0                        ; 0809F750
bne   @@Code0809F76E                ; 0809F752
b     @@Code0809F784                ; 0809F754
@@Code0809F756:
mov   r2,0x0                        ; 0809F756
cmp   r0,0x4                        ; 0809F758
bne   @@Code0809F75E                ; 0809F75A
mov   r2,0x1                        ; 0809F75C
@@Code0809F75E:
cmp   r2,0x0                        ; 0809F75E
beq   @@Code0809F778                ; 0809F760
mov   r0,0x0                        ; 0809F762
cmp   r1,0x2                        ; 0809F764
bne   @@Code0809F76A                ; 0809F766
mov   r0,0x1                        ; 0809F768
@@Code0809F76A:
cmp   r0,0x0                        ; 0809F76A
beq   @@Code0809F7A2                ; 0809F76C
@@Code0809F76E:
ldr   r0,=0x03002318                ; 0809F76E
b     @@Code0809F846                ; 0809F770
.pool                               ; 0809F772

@@Code0809F778:
mov   r2,0x0                        ; 0809F778
cmp   r1,0x2                        ; 0809F77A
bne   @@Code0809F780                ; 0809F77C
mov   r2,0x1                        ; 0809F77E
@@Code0809F780:
cmp   r2,0x0                        ; 0809F780
beq   @@Code0809F796                ; 0809F782
@@Code0809F784:
ldr   r0,[sp,0x4]                   ; 0809F784
ldr   r1,[sp,0x14]                  ; 0809F786
eor   r0,r1                         ; 0809F788
neg   r1,r0                         ; 0809F78A
orr   r1,r0                         ; 0809F78C
lsr   r1,r1,0x1F                    ; 0809F78E
str   r1,[sp,0x4]                   ; 0809F790
mov   r0,sp                         ; 0809F792
b     @@Code0809F846                ; 0809F794
@@Code0809F796:
mov   r1,0x0                        ; 0809F796
cmp   r0,0x2                        ; 0809F798
bne   @@Code0809F79E                ; 0809F79A
mov   r1,0x1                        ; 0809F79C
@@Code0809F79E:
cmp   r1,0x0                        ; 0809F79E
beq   @@Code0809F7B4                ; 0809F7A0
@@Code0809F7A2:
ldr   r0,[r7,0x4]                   ; 0809F7A2
@@Code0809F7A4:
ldr   r1,[sp,0x14]                  ; 0809F7A4
eor   r0,r1                         ; 0809F7A6
neg   r1,r0                         ; 0809F7A8
orr   r1,r0                         ; 0809F7AA
lsr   r1,r1,0x1F                    ; 0809F7AC
str   r1,[sp,0x14]                  ; 0809F7AE
mov   r0,r4                         ; 0809F7B0
b     @@Code0809F846                ; 0809F7B2
@@Code0809F7B4:
ldr   r0,[r7,0xC]                   ; 0809F7B4
mov   r1,0x0                        ; 0809F7B6
ldr   r2,[sp,0x1C]                  ; 0809F7B8
mov   r3,0x0                        ; 0809F7BA
bl    Sub0809FD64                   ; 0809F7BC
mov   r2,r1                         ; 0809F7C0
mov   r5,r2                         ; 0809F7C2
mov   r6,r0                         ; 0809F7C4
ldr   r4,[r7,0x8]                   ; 0809F7C6
ldr   r0,[sp,0x18]                  ; 0809F7C8
add   r4,r4,r0                      ; 0809F7CA
str   r4,[sp,0x28]                  ; 0809F7CC
ldr   r1,[r7,0x4]                   ; 0809F7CE
ldr   r0,[sp,0x14]                  ; 0809F7D0
eor   r1,r0                         ; 0809F7D2
neg   r0,r1                         ; 0809F7D4
orr   r0,r1                         ; 0809F7D6
lsr   r0,r0,0x1F                    ; 0809F7D8
str   r0,[sp,0x24]                  ; 0809F7DA
add   r4,0x2                        ; 0809F7DC
str   r4,[sp,0x28]                  ; 0809F7DE
cmp   r2,0x0                        ; 0809F7E0
bge   @@Code0809F800                ; 0809F7E2
mov   r2,0x1                        ; 0809F7E4
mov   r1,0x80                       ; 0809F7E6
lsl   r1,r1,0x18                    ; 0809F7E8
@@Code0809F7EA:
add   r4,0x1                        ; 0809F7EA
mov   r0,r5                         ; 0809F7EC
and   r0,r2                         ; 0809F7EE
cmp   r0,0x0                        ; 0809F7F0
beq   @@Code0809F7F8                ; 0809F7F2
lsr   r6,r6,0x1                     ; 0809F7F4
orr   r6,r1                         ; 0809F7F6
@@Code0809F7F8:
lsr   r5,r5,0x1                     ; 0809F7F8
cmp   r5,0x0                        ; 0809F7FA
blt   @@Code0809F7EA                ; 0809F7FC
str   r4,[sp,0x28]                  ; 0809F7FE
@@Code0809F800:
ldr   r0,=0x3FFFFFFF                ; 0809F800
cmp   r5,r0                         ; 0809F802
bhi   @@Code0809F826                ; 0809F804
mov   r4,0x80                       ; 0809F806
lsl   r4,r4,0x18                    ; 0809F808
mov   r3,0x1                        ; 0809F80A
mov   r2,r0                         ; 0809F80C
ldr   r1,[sp,0x28]                  ; 0809F80E
@@Code0809F810:
sub   r1,0x1                        ; 0809F810
lsl   r5,r5,0x1                     ; 0809F812
mov   r0,r6                         ; 0809F814
and   r0,r4                         ; 0809F816
cmp   r0,0x0                        ; 0809F818
beq   @@Code0809F81E                ; 0809F81A
orr   r5,r3                         ; 0809F81C
@@Code0809F81E:
lsl   r6,r6,0x1                     ; 0809F81E
cmp   r5,r2                         ; 0809F820
bls   @@Code0809F810                ; 0809F822
str   r1,[sp,0x28]                  ; 0809F824
@@Code0809F826:
mov   r0,0x7F                       ; 0809F826
and   r0,r5                         ; 0809F828
cmp   r0,0x40                       ; 0809F82A
bne   @@Code0809F83C                ; 0809F82C
mov   r0,0x80                       ; 0809F82E
and   r0,r5                         ; 0809F830
cmp   r0,0x0                        ; 0809F832
bne   @@Code0809F83A                ; 0809F834
cmp   r6,0x0                        ; 0809F836
beq   @@Code0809F83C                ; 0809F838
@@Code0809F83A:
add   r5,0x40                       ; 0809F83A
@@Code0809F83C:
str   r5,[sp,0x2C]                  ; 0809F83C
mov   r0,0x3                        ; 0809F83E
mov   r1,r8                         ; 0809F840
str   r0,[r1]                       ; 0809F842
mov   r0,r9                         ; 0809F844
@@Code0809F846:
bl    Sub0809F3E4                   ; 0809F846
add   sp,0x38                       ; 0809F84A
pop   {r3-r4}                       ; 0809F84C
mov   r8,r3                         ; 0809F84E
mov   r9,r4                         ; 0809F850
pop   {r4-r7,pc}                    ; 0809F852
.pool                               ; 0809F854

push  {r4-r6,lr}                    ; 0809F858
add   sp,-0x28                      ; 0809F85A
str   r0,[sp,0x20]                  ; 0809F85C
str   r1,[sp,0x24]                  ; 0809F85E
add   r0,sp,0x20                    ; 0809F860
mov   r1,sp                         ; 0809F862
bl    Sub0809F49C                   ; 0809F864
add   r0,sp,0x24                    ; 0809F868
add   r5,sp,0x10                    ; 0809F86A
mov   r1,r5                         ; 0809F86C
bl    Sub0809F49C                   ; 0809F86E
mov   r4,sp                         ; 0809F872
mov   r0,0x0                        ; 0809F874
ldr   r3,[sp]                       ; 0809F876
cmp   r3,0x1                        ; 0809F878
bhi   @@Code0809F87E                ; 0809F87A
mov   r0,0x1                        ; 0809F87C
@@Code0809F87E:
cmp   r0,0x0                        ; 0809F87E
beq   @@Code0809F886                ; 0809F880
mov   r1,sp                         ; 0809F882
b     @@Code0809F938                ; 0809F884
@@Code0809F886:
mov   r0,0x0                        ; 0809F886
ldr   r2,[sp,0x10]                  ; 0809F888
mov   r6,r2                         ; 0809F88A
cmp   r2,0x1                        ; 0809F88C
bhi   @@Code0809F892                ; 0809F88E
mov   r0,0x1                        ; 0809F890
@@Code0809F892:
cmp   r0,0x0                        ; 0809F892
beq   @@Code0809F89A                ; 0809F894
mov   r1,r5                         ; 0809F896
b     @@Code0809F938                ; 0809F898
@@Code0809F89A:
ldr   r0,[sp,0x4]                   ; 0809F89A
ldr   r1,[sp,0x14]                  ; 0809F89C
eor   r0,r1                         ; 0809F89E
str   r0,[sp,0x4]                   ; 0809F8A0
mov   r0,0x0                        ; 0809F8A2
cmp   r3,0x4                        ; 0809F8A4
bne   @@Code0809F8AA                ; 0809F8A6
mov   r0,0x1                        ; 0809F8A8
@@Code0809F8AA:
cmp   r0,0x0                        ; 0809F8AA
bne   @@Code0809F8BA                ; 0809F8AC
mov   r0,0x0                        ; 0809F8AE
cmp   r3,0x2                        ; 0809F8B0
bne   @@Code0809F8B6                ; 0809F8B2
mov   r0,0x1                        ; 0809F8B4
@@Code0809F8B6:
cmp   r0,0x0                        ; 0809F8B6
beq   @@Code0809F8CC                ; 0809F8B8
@@Code0809F8BA:
ldr   r0,[r4]                       ; 0809F8BA
mov   r1,r4                         ; 0809F8BC
cmp   r0,r6                         ; 0809F8BE
bne   @@Code0809F938                ; 0809F8C0
ldr   r1,=0x03002318                ; 0809F8C2
b     @@Code0809F938                ; 0809F8C4
.pool                               ; 0809F8C6

@@Code0809F8CC:
mov   r1,0x0                        ; 0809F8CC
cmp   r2,0x4                        ; 0809F8CE
bne   @@Code0809F8D4                ; 0809F8D0
mov   r1,0x1                        ; 0809F8D2
@@Code0809F8D4:
cmp   r1,0x0                        ; 0809F8D4
beq   @@Code0809F8E0                ; 0809F8D6
str   r0,[sp,0xC]                   ; 0809F8D8
str   r0,[sp,0x8]                   ; 0809F8DA
mov   r1,sp                         ; 0809F8DC
b     @@Code0809F938                ; 0809F8DE
@@Code0809F8E0:
mov   r0,0x0                        ; 0809F8E0
cmp   r2,0x2                        ; 0809F8E2
bne   @@Code0809F8E8                ; 0809F8E4
mov   r0,0x1                        ; 0809F8E6
@@Code0809F8E8:
cmp   r0,0x0                        ; 0809F8E8
beq   @@Code0809F8F2                ; 0809F8EA
mov   r0,0x4                        ; 0809F8EC
str   r0,[r4]                       ; 0809F8EE
b     @@Code0809F936                ; 0809F8F0
@@Code0809F8F2:
ldr   r1,[r4,0x8]                   ; 0809F8F2
ldr   r0,[sp,0x18]                  ; 0809F8F4
sub   r0,r1,r0                      ; 0809F8F6
str   r0,[r4,0x8]                   ; 0809F8F8
ldr   r2,[r4,0xC]                   ; 0809F8FA
ldr   r3,[sp,0x1C]                  ; 0809F8FC
cmp   r2,r3                         ; 0809F8FE
bhs   @@Code0809F908                ; 0809F900
lsl   r2,r2,0x1                     ; 0809F902
sub   r0,0x1                        ; 0809F904
str   r0,[r4,0x8]                   ; 0809F906
@@Code0809F908:
mov   r0,0x80                       ; 0809F908
lsl   r0,r0,0x17                    ; 0809F90A
mov   r1,0x0                        ; 0809F90C
@@Code0809F90E:
cmp   r2,r3                         ; 0809F90E
blo   @@Code0809F916                ; 0809F910
orr   r1,r0                         ; 0809F912
sub   r2,r2,r3                      ; 0809F914
@@Code0809F916:
lsr   r0,r0,0x1                     ; 0809F916
lsl   r2,r2,0x1                     ; 0809F918
cmp   r0,0x0                        ; 0809F91A
bne   @@Code0809F90E                ; 0809F91C
mov   r0,0x7F                       ; 0809F91E
and   r0,r1                         ; 0809F920
cmp   r0,0x40                       ; 0809F922
bne   @@Code0809F934                ; 0809F924
mov   r0,0x80                       ; 0809F926
and   r0,r1                         ; 0809F928
cmp   r0,0x0                        ; 0809F92A
bne   @@Code0809F932                ; 0809F92C
cmp   r2,0x0                        ; 0809F92E
beq   @@Code0809F934                ; 0809F930
@@Code0809F932:
add   r1,0x40                       ; 0809F932
@@Code0809F934:
str   r1,[r4,0xC]                   ; 0809F934
@@Code0809F936:
mov   r1,r4                         ; 0809F936
@@Code0809F938:
mov   r0,r1                         ; 0809F938
bl    Sub0809F3E4                   ; 0809F93A
add   sp,0x28                       ; 0809F93E
pop   {r4-r6,pc}                    ; 0809F940
.pool                               ; 0809F942

Sub0809F944:
push  {r4,lr}                       ; 0809F944
mov   r4,r0                         ; 0809F946
mov   r0,0x0                        ; 0809F948
ldr   r2,[r4]                       ; 0809F94A
cmp   r2,0x1                        ; 0809F94C
bhi   @@Code0809F952                ; 0809F94E
mov   r0,0x1                        ; 0809F950
@@Code0809F952:
cmp   r0,0x0                        ; 0809F952
bne   @@Code0809F964                ; 0809F954
mov   r0,0x0                        ; 0809F956
ldr   r3,[r1]                       ; 0809F958
cmp   r3,0x1                        ; 0809F95A
bhi   @@Code0809F960                ; 0809F95C
mov   r0,0x1                        ; 0809F95E
@@Code0809F960:
cmp   r0,0x0                        ; 0809F960
beq   @@Code0809F968                ; 0809F962
@@Code0809F964:
mov   r0,0x1                        ; 0809F964
b     @@Code0809FA26                ; 0809F966
@@Code0809F968:
mov   r0,0x0                        ; 0809F968
cmp   r2,0x4                        ; 0809F96A
bne   @@Code0809F970                ; 0809F96C
mov   r0,0x1                        ; 0809F96E
@@Code0809F970:
cmp   r0,0x0                        ; 0809F970
beq   @@Code0809F988                ; 0809F972
mov   r0,0x0                        ; 0809F974
cmp   r3,0x4                        ; 0809F976
bne   @@Code0809F97C                ; 0809F978
mov   r0,0x1                        ; 0809F97A
@@Code0809F97C:
cmp   r0,0x0                        ; 0809F97C
beq   @@Code0809F988                ; 0809F97E
ldr   r0,[r1,0x4]                   ; 0809F980
ldr   r1,[r4,0x4]                   ; 0809F982
sub   r0,r0,r1                      ; 0809F984
b     @@Code0809FA26                ; 0809F986
@@Code0809F988:
mov   r2,0x0                        ; 0809F988
ldr   r0,[r4]                       ; 0809F98A
cmp   r0,0x4                        ; 0809F98C
bne   @@Code0809F992                ; 0809F98E
mov   r2,0x1                        ; 0809F990
@@Code0809F992:
cmp   r2,0x0                        ; 0809F992
bne   @@Code0809F9E0                ; 0809F994
mov   r2,0x0                        ; 0809F996
cmp   r3,0x4                        ; 0809F998
bne   @@Code0809F99E                ; 0809F99A
mov   r2,0x1                        ; 0809F99C
@@Code0809F99E:
cmp   r2,0x0                        ; 0809F99E
beq   @@Code0809F9B0                ; 0809F9A0
@@Code0809F9A2:
ldr   r0,[r1,0x4]                   ; 0809F9A2
mov   r1,0x1                        ; 0809F9A4
neg   r1,r1                         ; 0809F9A6
cmp   r0,0x0                        ; 0809F9A8
beq   @@Code0809F9EA                ; 0809F9AA
mov   r1,0x1                        ; 0809F9AC
b     @@Code0809F9EA                ; 0809F9AE
@@Code0809F9B0:
mov   r2,0x0                        ; 0809F9B0
cmp   r0,0x2                        ; 0809F9B2
bne   @@Code0809F9B8                ; 0809F9B4
mov   r2,0x1                        ; 0809F9B6
@@Code0809F9B8:
cmp   r2,0x0                        ; 0809F9B8
beq   @@Code0809F9C8                ; 0809F9BA
mov   r2,0x0                        ; 0809F9BC
cmp   r3,0x2                        ; 0809F9BE
bne   @@Code0809F9C4                ; 0809F9C0
mov   r2,0x1                        ; 0809F9C2
@@Code0809F9C4:
cmp   r2,0x0                        ; 0809F9C4
bne   @@Code0809FA24                ; 0809F9C6
@@Code0809F9C8:
mov   r2,0x0                        ; 0809F9C8
cmp   r0,0x2                        ; 0809F9CA
bne   @@Code0809F9D0                ; 0809F9CC
mov   r2,0x1                        ; 0809F9CE
@@Code0809F9D0:
cmp   r2,0x0                        ; 0809F9D0
bne   @@Code0809F9A2                ; 0809F9D2
mov   r0,0x0                        ; 0809F9D4
cmp   r3,0x2                        ; 0809F9D6
bne   @@Code0809F9DC                ; 0809F9D8
mov   r0,0x1                        ; 0809F9DA
@@Code0809F9DC:
cmp   r0,0x0                        ; 0809F9DC
beq   @@Code0809F9EE                ; 0809F9DE
@@Code0809F9E0:
ldr   r0,[r4,0x4]                   ; 0809F9E0
mov   r1,0x1                        ; 0809F9E2
cmp   r0,0x0                        ; 0809F9E4
beq   @@Code0809F9EA                ; 0809F9E6
sub   r1,0x2                        ; 0809F9E8
@@Code0809F9EA:
mov   r0,r1                         ; 0809F9EA
b     @@Code0809FA26                ; 0809F9EC
@@Code0809F9EE:
ldr   r3,[r4,0x4]                   ; 0809F9EE
ldr   r0,[r1,0x4]                   ; 0809F9F0
cmp   r3,r0                         ; 0809F9F2
beq   @@Code0809FA00                ; 0809F9F4
@@Code0809F9F6:
mov   r0,0x1                        ; 0809F9F6
cmp   r3,0x0                        ; 0809F9F8
beq   @@Code0809FA26                ; 0809F9FA
sub   r0,0x2                        ; 0809F9FC
b     @@Code0809FA26                ; 0809F9FE
@@Code0809FA00:
ldr   r2,[r4,0x8]                   ; 0809FA00
ldr   r0,[r1,0x8]                   ; 0809FA02
cmp   r2,r0                         ; 0809FA04
bgt   @@Code0809F9F6                ; 0809FA06
cmp   r2,r0                         ; 0809FA08
bge   @@Code0809FA18                ; 0809FA0A
@@Code0809FA0C:
mov   r0,0x1                        ; 0809FA0C
neg   r0,r0                         ; 0809FA0E
cmp   r3,0x0                        ; 0809FA10
beq   @@Code0809FA26                ; 0809FA12
mov   r0,0x1                        ; 0809FA14
b     @@Code0809FA26                ; 0809FA16
@@Code0809FA18:
ldr   r0,[r4,0xC]                   ; 0809FA18
ldr   r1,[r1,0xC]                   ; 0809FA1A
cmp   r0,r1                         ; 0809FA1C
bhi   @@Code0809F9F6                ; 0809FA1E
cmp   r0,r1                         ; 0809FA20
blo   @@Code0809FA0C                ; 0809FA22
@@Code0809FA24:
mov   r0,0x0                        ; 0809FA24
@@Code0809FA26:
pop   {r4,pc}                       ; 0809FA26

push  {r4,lr}                       ; 0809FA28
add   sp,-0x28                      ; 0809FA2A
str   r0,[sp,0x20]                  ; 0809FA2C
str   r1,[sp,0x24]                  ; 0809FA2E
add   r0,sp,0x20                    ; 0809FA30
mov   r1,sp                         ; 0809FA32
bl    Sub0809F49C                   ; 0809FA34
add   r0,sp,0x24                    ; 0809FA38
add   r4,sp,0x10                    ; 0809FA3A
mov   r1,r4                         ; 0809FA3C
bl    Sub0809F49C                   ; 0809FA3E
mov   r0,sp                         ; 0809FA42
mov   r1,r4                         ; 0809FA44
bl    Sub0809F944                   ; 0809FA46
add   sp,0x28                       ; 0809FA4A
pop   {r4,pc}                       ; 0809FA4C
.pool                               ; 0809FA4E

push  {r4,lr}                       ; 0809FA50
add   sp,-0x28                      ; 0809FA52
str   r0,[sp,0x20]                  ; 0809FA54
str   r1,[sp,0x24]                  ; 0809FA56
add   r0,sp,0x20                    ; 0809FA58
mov   r1,sp                         ; 0809FA5A
bl    Sub0809F49C                   ; 0809FA5C
add   r0,sp,0x24                    ; 0809FA60
add   r4,sp,0x10                    ; 0809FA62
mov   r1,r4                         ; 0809FA64
bl    Sub0809F49C                   ; 0809FA66
mov   r1,0x0                        ; 0809FA6A
ldr   r0,[sp]                       ; 0809FA6C
cmp   r0,0x1                        ; 0809FA6E
bhi   @@Code0809FA74                ; 0809FA70
mov   r1,0x1                        ; 0809FA72
@@Code0809FA74:
cmp   r1,0x0                        ; 0809FA74
bne   @@Code0809FA86                ; 0809FA76
mov   r1,0x0                        ; 0809FA78
ldr   r0,[sp,0x10]                  ; 0809FA7A
cmp   r0,0x1                        ; 0809FA7C
bhi   @@Code0809FA82                ; 0809FA7E
mov   r1,0x1                        ; 0809FA80
@@Code0809FA82:
cmp   r1,0x0                        ; 0809FA82
beq   @@Code0809FA8A                ; 0809FA84
@@Code0809FA86:
mov   r0,0x1                        ; 0809FA86
b     @@Code0809FA92                ; 0809FA88
@@Code0809FA8A:
mov   r0,sp                         ; 0809FA8A
mov   r1,r4                         ; 0809FA8C
bl    Sub0809F944                   ; 0809FA8E
@@Code0809FA92:
add   sp,0x28                       ; 0809FA92
pop   {r4,pc}                       ; 0809FA94
.pool                               ; 0809FA96

push  {r4,lr}                       ; 0809FA98
add   sp,-0x28                      ; 0809FA9A
str   r0,[sp,0x20]                  ; 0809FA9C
str   r1,[sp,0x24]                  ; 0809FA9E
add   r0,sp,0x20                    ; 0809FAA0
mov   r1,sp                         ; 0809FAA2
bl    Sub0809F49C                   ; 0809FAA4
add   r0,sp,0x24                    ; 0809FAA8
add   r4,sp,0x10                    ; 0809FAAA
mov   r1,r4                         ; 0809FAAC
bl    Sub0809F49C                   ; 0809FAAE
mov   r1,0x0                        ; 0809FAB2
ldr   r0,[sp]                       ; 0809FAB4
cmp   r0,0x1                        ; 0809FAB6
bhi   @@Code0809FABC                ; 0809FAB8
mov   r1,0x1                        ; 0809FABA
@@Code0809FABC:
cmp   r1,0x0                        ; 0809FABC
bne   @@Code0809FACE                ; 0809FABE
mov   r1,0x0                        ; 0809FAC0
ldr   r0,[sp,0x10]                  ; 0809FAC2
cmp   r0,0x1                        ; 0809FAC4
bhi   @@Code0809FACA                ; 0809FAC6
mov   r1,0x1                        ; 0809FAC8
@@Code0809FACA:
cmp   r1,0x0                        ; 0809FACA
beq   @@Code0809FAD2                ; 0809FACC
@@Code0809FACE:
mov   r0,0x1                        ; 0809FACE
b     @@Code0809FADA                ; 0809FAD0
@@Code0809FAD2:
mov   r0,sp                         ; 0809FAD2
mov   r1,r4                         ; 0809FAD4
bl    Sub0809F944                   ; 0809FAD6
@@Code0809FADA:
add   sp,0x28                       ; 0809FADA
pop   {r4,pc}                       ; 0809FADC
.pool                               ; 0809FADE

push  {r4,lr}                       ; 0809FAE0
add   sp,-0x28                      ; 0809FAE2
str   r0,[sp,0x20]                  ; 0809FAE4
str   r1,[sp,0x24]                  ; 0809FAE6
add   r0,sp,0x20                    ; 0809FAE8
mov   r1,sp                         ; 0809FAEA
bl    Sub0809F49C                   ; 0809FAEC
add   r0,sp,0x24                    ; 0809FAF0
add   r4,sp,0x10                    ; 0809FAF2
mov   r1,r4                         ; 0809FAF4
bl    Sub0809F49C                   ; 0809FAF6
mov   r1,0x0                        ; 0809FAFA
ldr   r0,[sp]                       ; 0809FAFC
cmp   r0,0x1                        ; 0809FAFE
bhi   @@Code0809FB04                ; 0809FB00
mov   r1,0x1                        ; 0809FB02
@@Code0809FB04:
cmp   r1,0x0                        ; 0809FB04
bne   @@Code0809FB16                ; 0809FB06
mov   r1,0x0                        ; 0809FB08
ldr   r0,[sp,0x10]                  ; 0809FB0A
cmp   r0,0x1                        ; 0809FB0C
bhi   @@Code0809FB12                ; 0809FB0E
mov   r1,0x1                        ; 0809FB10
@@Code0809FB12:
cmp   r1,0x0                        ; 0809FB12
beq   @@Code0809FB1C                ; 0809FB14
@@Code0809FB16:
mov   r0,0x1                        ; 0809FB16
neg   r0,r0                         ; 0809FB18
b     @@Code0809FB24                ; 0809FB1A
@@Code0809FB1C:
mov   r0,sp                         ; 0809FB1C
mov   r1,r4                         ; 0809FB1E
bl    Sub0809F944                   ; 0809FB20
@@Code0809FB24:
add   sp,0x28                       ; 0809FB24
pop   {r4,pc}                       ; 0809FB26

push  {r4,lr}                       ; 0809FB28
add   sp,-0x28                      ; 0809FB2A
str   r0,[sp,0x20]                  ; 0809FB2C
str   r1,[sp,0x24]                  ; 0809FB2E
add   r0,sp,0x20                    ; 0809FB30
mov   r1,sp                         ; 0809FB32
bl    Sub0809F49C                   ; 0809FB34
add   r0,sp,0x24                    ; 0809FB38
add   r4,sp,0x10                    ; 0809FB3A
mov   r1,r4                         ; 0809FB3C
bl    Sub0809F49C                   ; 0809FB3E
mov   r1,0x0                        ; 0809FB42
ldr   r0,[sp]                       ; 0809FB44
cmp   r0,0x1                        ; 0809FB46
bhi   @@Code0809FB4C                ; 0809FB48
mov   r1,0x1                        ; 0809FB4A
@@Code0809FB4C:
cmp   r1,0x0                        ; 0809FB4C
bne   @@Code0809FB5E                ; 0809FB4E
mov   r1,0x0                        ; 0809FB50
ldr   r0,[sp,0x10]                  ; 0809FB52
cmp   r0,0x1                        ; 0809FB54
bhi   @@Code0809FB5A                ; 0809FB56
mov   r1,0x1                        ; 0809FB58
@@Code0809FB5A:
cmp   r1,0x0                        ; 0809FB5A
beq   @@Code0809FB64                ; 0809FB5C
@@Code0809FB5E:
mov   r0,0x1                        ; 0809FB5E
neg   r0,r0                         ; 0809FB60
b     @@Code0809FB6C                ; 0809FB62
@@Code0809FB64:
mov   r0,sp                         ; 0809FB64
mov   r1,r4                         ; 0809FB66
bl    Sub0809F944                   ; 0809FB68
@@Code0809FB6C:
add   sp,0x28                       ; 0809FB6C
pop   {r4,pc}                       ; 0809FB6E

push  {r4,lr}                       ; 0809FB70
add   sp,-0x28                      ; 0809FB72
str   r0,[sp,0x20]                  ; 0809FB74
str   r1,[sp,0x24]                  ; 0809FB76
add   r0,sp,0x20                    ; 0809FB78
mov   r1,sp                         ; 0809FB7A
bl    Sub0809F49C                   ; 0809FB7C
add   r0,sp,0x24                    ; 0809FB80
add   r4,sp,0x10                    ; 0809FB82
mov   r1,r4                         ; 0809FB84
bl    Sub0809F49C                   ; 0809FB86
mov   r1,0x0                        ; 0809FB8A
ldr   r0,[sp]                       ; 0809FB8C
cmp   r0,0x1                        ; 0809FB8E
bhi   @@Code0809FB94                ; 0809FB90
mov   r1,0x1                        ; 0809FB92
@@Code0809FB94:
cmp   r1,0x0                        ; 0809FB94
bne   @@Code0809FBA6                ; 0809FB96
mov   r1,0x0                        ; 0809FB98
ldr   r0,[sp,0x10]                  ; 0809FB9A
cmp   r0,0x1                        ; 0809FB9C
bhi   @@Code0809FBA2                ; 0809FB9E
mov   r1,0x1                        ; 0809FBA0
@@Code0809FBA2:
cmp   r1,0x0                        ; 0809FBA2
beq   @@Code0809FBAA                ; 0809FBA4
@@Code0809FBA6:
mov   r0,0x1                        ; 0809FBA6
b     @@Code0809FBB2                ; 0809FBA8
@@Code0809FBAA:
mov   r0,sp                         ; 0809FBAA
mov   r1,r4                         ; 0809FBAC
bl    Sub0809F944                   ; 0809FBAE
@@Code0809FBB2:
add   sp,0x28                       ; 0809FBB2
pop   {r4,pc}                       ; 0809FBB4
.pool                               ; 0809FBB6

push  {r4,lr}                       ; 0809FBB8
add   sp,-0x28                      ; 0809FBBA
str   r0,[sp,0x20]                  ; 0809FBBC
str   r1,[sp,0x24]                  ; 0809FBBE
add   r0,sp,0x20                    ; 0809FBC0
mov   r1,sp                         ; 0809FBC2
bl    Sub0809F49C                   ; 0809FBC4
add   r0,sp,0x24                    ; 0809FBC8
add   r4,sp,0x10                    ; 0809FBCA
mov   r1,r4                         ; 0809FBCC
bl    Sub0809F49C                   ; 0809FBCE
mov   r1,0x0                        ; 0809FBD2
ldr   r0,[sp]                       ; 0809FBD4
cmp   r0,0x1                        ; 0809FBD6
bhi   @@Code0809FBDC                ; 0809FBD8
mov   r1,0x1                        ; 0809FBDA
@@Code0809FBDC:
cmp   r1,0x0                        ; 0809FBDC
bne   @@Code0809FBEE                ; 0809FBDE
mov   r1,0x0                        ; 0809FBE0
ldr   r0,[sp,0x10]                  ; 0809FBE2
cmp   r0,0x1                        ; 0809FBE4
bhi   @@Code0809FBEA                ; 0809FBE6
mov   r1,0x1                        ; 0809FBE8
@@Code0809FBEA:
cmp   r1,0x0                        ; 0809FBEA
beq   @@Code0809FBF2                ; 0809FBEC
@@Code0809FBEE:
mov   r0,0x1                        ; 0809FBEE
b     @@Code0809FBFA                ; 0809FBF0
@@Code0809FBF2:
mov   r0,sp                         ; 0809FBF2
mov   r1,r4                         ; 0809FBF4
bl    Sub0809F944                   ; 0809FBF6
@@Code0809FBFA:
add   sp,0x28                       ; 0809FBFA
pop   {r4,pc}                       ; 0809FBFC
.pool                               ; 0809FBFE

push  {lr}                          ; 0809FC00
add   sp,-0x10                      ; 0809FC02
mov   r1,r0                         ; 0809FC04
mov   r0,0x3                        ; 0809FC06
str   r0,[sp]                       ; 0809FC08
lsr   r2,r1,0x1F                    ; 0809FC0A
str   r2,[sp,0x4]                   ; 0809FC0C
cmp   r1,0x0                        ; 0809FC0E
bne   @@Code0809FC18                ; 0809FC10
mov   r0,0x2                        ; 0809FC12
str   r0,[sp]                       ; 0809FC14
b     @@Code0809FC50                ; 0809FC16
@@Code0809FC18:
mov   r0,0x1E                       ; 0809FC18
str   r0,[sp,0x8]                   ; 0809FC1A
cmp   r2,0x0                        ; 0809FC1C
beq   @@Code0809FC36                ; 0809FC1E
mov   r0,0x80                       ; 0809FC20
lsl   r0,r0,0x18                    ; 0809FC22
cmp   r1,r0                         ; 0809FC24
bne   @@Code0809FC30                ; 0809FC26
ldr   r0,=0xCF000000                ; 0809FC28
b     @@Code0809FC56                ; 0809FC2A
.pool                               ; 0809FC2C

@@Code0809FC30:
neg   r0,r1                         ; 0809FC30
str   r0,[sp,0xC]                   ; 0809FC32
b     @@Code0809FC38                ; 0809FC34
@@Code0809FC36:
str   r1,[sp,0xC]                   ; 0809FC36
@@Code0809FC38:
ldr   r2,[sp,0xC]                   ; 0809FC38
ldr   r3,=0x3FFFFFFF                ; 0809FC3A
cmp   r2,r3                         ; 0809FC3C
bhi   @@Code0809FC50                ; 0809FC3E
ldr   r1,[sp,0x8]                   ; 0809FC40
@@Code0809FC42:
lsl   r0,r2,0x1                     ; 0809FC42
sub   r1,0x1                        ; 0809FC44
mov   r2,r0                         ; 0809FC46
cmp   r0,r3                         ; 0809FC48
bls   @@Code0809FC42                ; 0809FC4A
str   r1,[sp,0x8]                   ; 0809FC4C
str   r0,[sp,0xC]                   ; 0809FC4E
@@Code0809FC50:
mov   r0,sp                         ; 0809FC50
bl    Sub0809F3E4                   ; 0809FC52
@@Code0809FC56:
add   sp,0x10                       ; 0809FC56
pop   {pc}                          ; 0809FC58
.pool                               ; 0809FC5A

push  {lr}                          ; 0809FC60
add   sp,-0x14                      ; 0809FC62
str   r0,[sp,0x10]                  ; 0809FC64
add   r0,sp,0x10                    ; 0809FC66
mov   r1,sp                         ; 0809FC68
bl    Sub0809F49C                   ; 0809FC6A
mov   r1,0x0                        ; 0809FC6E
ldr   r0,[sp]                       ; 0809FC70
cmp   r0,0x2                        ; 0809FC72
bne   @@Code0809FC78                ; 0809FC74
mov   r1,0x1                        ; 0809FC76
@@Code0809FC78:
cmp   r1,0x0                        ; 0809FC78
bne   @@Code0809FCAA                ; 0809FC7A
mov   r1,0x0                        ; 0809FC7C
cmp   r0,0x1                        ; 0809FC7E
bhi   @@Code0809FC84                ; 0809FC80
mov   r1,0x1                        ; 0809FC82
@@Code0809FC84:
cmp   r1,0x0                        ; 0809FC84
bne   @@Code0809FCAA                ; 0809FC86
mov   r1,0x0                        ; 0809FC88
cmp   r0,0x4                        ; 0809FC8A
bne   @@Code0809FC90                ; 0809FC8C
mov   r1,0x1                        ; 0809FC8E
@@Code0809FC90:
cmp   r1,0x0                        ; 0809FC90
beq   @@Code0809FCA4                ; 0809FC92
@@Code0809FC94:
ldr   r0,[sp,0x4]                   ; 0809FC94
ldr   r1,=0x7FFFFFFF                ; 0809FC96
cmp   r0,0x0                        ; 0809FC98
beq   @@Code0809FCC2                ; 0809FC9A
add   r1,0x1                        ; 0809FC9C
b     @@Code0809FCC2                ; 0809FC9E
.pool                               ; 0809FCA0

@@Code0809FCA4:
ldr   r1,[sp,0x8]                   ; 0809FCA4
cmp   r1,0x0                        ; 0809FCA6
bge   @@Code0809FCAE                ; 0809FCA8
@@Code0809FCAA:
mov   r0,0x0                        ; 0809FCAA
b     @@Code0809FCC4                ; 0809FCAC
@@Code0809FCAE:
cmp   r1,0x1E                       ; 0809FCAE
bgt   @@Code0809FC94                ; 0809FCB0
mov   r0,0x1E                       ; 0809FCB2
sub   r0,r0,r1                      ; 0809FCB4
ldr   r1,[sp,0xC]                   ; 0809FCB6
lsr   r1,r0                         ; 0809FCB8
ldr   r0,[sp,0x4]                   ; 0809FCBA
cmp   r0,0x0                        ; 0809FCBC
beq   @@Code0809FCC2                ; 0809FCBE
neg   r1,r1                         ; 0809FCC0
@@Code0809FCC2:
mov   r0,r1                         ; 0809FCC2
@@Code0809FCC4:
add   sp,0x14                       ; 0809FCC4
pop   {pc}                          ; 0809FCC6

push  {lr}                          ; 0809FCC8
add   sp,-0x14                      ; 0809FCCA
str   r0,[sp,0x10]                  ; 0809FCCC
add   r0,sp,0x10                    ; 0809FCCE
mov   r1,sp                         ; 0809FCD0
bl    Sub0809F49C                   ; 0809FCD2
mov   r1,0x0                        ; 0809FCD6
ldr   r0,[sp,0x4]                   ; 0809FCD8
cmp   r0,0x0                        ; 0809FCDA
bne   @@Code0809FCE0                ; 0809FCDC
mov   r1,0x1                        ; 0809FCDE
@@Code0809FCE0:
str   r1,[sp,0x4]                   ; 0809FCE0
mov   r0,sp                         ; 0809FCE2
bl    Sub0809F3E4                   ; 0809FCE4
add   sp,0x14                       ; 0809FCE8
pop   {pc}                          ; 0809FCEA

Sub0809FCEC:
push  {lr}                          ; 0809FCEC
add   sp,-0x10                      ; 0809FCEE
str   r0,[sp]                       ; 0809FCF0
str   r1,[sp,0x4]                   ; 0809FCF2
str   r2,[sp,0x8]                   ; 0809FCF4
str   r3,[sp,0xC]                   ; 0809FCF6
mov   r0,sp                         ; 0809FCF8
bl    Sub0809F3E4                   ; 0809FCFA
add   sp,0x10                       ; 0809FCFE
pop   {pc}                          ; 0809FD00
.pool                               ; 0809FD02

push  {r4-r6,lr}                    ; 0809FD04
add   sp,-0x18                      ; 0809FD06
str   r0,[sp,0x14]                  ; 0809FD08
add   r0,sp,0x14                    ; 0809FD0A
add   r1,sp,0x4                     ; 0809FD0C
bl    Sub0809F49C                   ; 0809FD0E
ldr   r0,[sp,0x4]                   ; 0809FD12
ldr   r1,[sp,0x8]                   ; 0809FD14
ldr   r2,[sp,0xC]                   ; 0809FD16
ldr   r3,[sp,0x10]                  ; 0809FD18
mov   r4,0x0                        ; 0809FD1A
lsr   r6,r3,0x2                     ; 0809FD1C
lsl   r5,r4,0x1E                    ; 0809FD1E
mov   r4,r6                         ; 0809FD20
orr   r4,r5                         ; 0809FD22
lsl   r3,r3,0x1E                    ; 0809FD24
str   r4,[sp]                       ; 0809FD26
bl    Sub0809F378                   ; 0809FD28
add   sp,0x18                       ; 0809FD2C
pop   {r4-r6,pc}                    ; 0809FD2E

Sub0809FD30:
push  {r4-r6,lr}                    ; 0809FD30
mov   r6,r1                         ; 0809FD32
mov   r5,r0                         ; 0809FD34
cmp   r2,0x0                        ; 0809FD36
beq   @@Code0809FD60                ; 0809FD38
mov   r0,0x20                       ; 0809FD3A
sub   r0,r0,r2                      ; 0809FD3C
cmp   r0,0x0                        ; 0809FD3E
bgt   @@Code0809FD4C                ; 0809FD40
mov   r4,0x0                        ; 0809FD42
neg   r0,r0                         ; 0809FD44
mov   r3,r6                         ; 0809FD46
lsr   r3,r0                         ; 0809FD48
b     @@Code0809FD5C                ; 0809FD4A
@@Code0809FD4C:
mov   r1,r6                         ; 0809FD4C
lsl   r1,r0                         ; 0809FD4E
mov   r4,r6                         ; 0809FD50
lsr   r4,r2                         ; 0809FD52
mov   r0,r5                         ; 0809FD54
lsr   r0,r2                         ; 0809FD56
mov   r3,r0                         ; 0809FD58
orr   r3,r1                         ; 0809FD5A
@@Code0809FD5C:
mov   r1,r4                         ; 0809FD5C
mov   r0,r3                         ; 0809FD5E
@@Code0809FD60:
pop   {r4-r6,pc}                    ; 0809FD60
.pool                               ; 0809FD62

Sub0809FD64:
push  {r4-r7,lr}                    ; 0809FD64
add   sp,-0x10                      ; 0809FD66
str   r0,[sp]                       ; 0809FD68
str   r1,[sp,0x4]                   ; 0809FD6A
str   r2,[sp,0x8]                   ; 0809FD6C
str   r3,[sp,0xC]                   ; 0809FD6E
ldr   r3,[sp]                       ; 0809FD70
ldr   r0,=0xFFFF                    ; 0809FD72
mov   r12,r0                        ; 0809FD74
mov   r2,r3                         ; 0809FD76
and   r2,r0                         ; 0809FD78
lsr   r3,r3,0x10                    ; 0809FD7A
ldr   r1,[sp,0x8]                   ; 0809FD7C
mov   r0,r1                         ; 0809FD7E
mov   r4,r12                        ; 0809FD80
and   r0,r4                         ; 0809FD82
lsr   r1,r1,0x10                    ; 0809FD84
mov   r5,r2                         ; 0809FD86
mul   r5,r0                         ; 0809FD88
mov   r4,r2                         ; 0809FD8A
mul   r4,r1                         ; 0809FD8C
mov   r2,r3                         ; 0809FD8E
mul   r2,r0                         ; 0809FD90
mul   r3,r1                         ; 0809FD92
lsr   r0,r5,0x10                    ; 0809FD94
add   r4,r4,r0                      ; 0809FD96
add   r4,r4,r2                      ; 0809FD98
cmp   r4,r2                         ; 0809FD9A
bhs   @@Code0809FDA4                ; 0809FD9C
mov   r0,0x80                       ; 0809FD9E
lsl   r0,r0,0x9                     ; 0809FDA0
add   r3,r3,r0                      ; 0809FDA2
@@Code0809FDA4:
lsr   r0,r4,0x10                    ; 0809FDA4
add   r7,r3,r0                      ; 0809FDA6
mov   r1,r12                        ; 0809FDA8
and   r4,r1                         ; 0809FDAA
lsl   r0,r4,0x10                    ; 0809FDAC
and   r5,r1                         ; 0809FDAE
mov   r6,r0                         ; 0809FDB0
orr   r6,r5                         ; 0809FDB2
mov   r1,r7                         ; 0809FDB4
mov   r0,r6                         ; 0809FDB6
ldr   r3,[sp]                       ; 0809FDB8
ldr   r4,[sp,0xC]                   ; 0809FDBA
mov   r2,r3                         ; 0809FDBC
mul   r2,r4                         ; 0809FDBE
ldr   r5,[sp,0x4]                   ; 0809FDC0
ldr   r4,[sp,0x8]                   ; 0809FDC2
mov   r3,r5                         ; 0809FDC4
mul   r3,r4                         ; 0809FDC6
add   r2,r2,r3                      ; 0809FDC8
add   r1,r7,r2                      ; 0809FDCA
add   sp,0x10                       ; 0809FDCC
pop   {r4-r7,pc}                    ; 0809FDCE
.pool                               ; 0809FDD0

Sub0809FDD4:
push  {r4,lr}                       ; 0809FDD4
neg   r2,r0                         ; 0809FDD6
mov   r3,r2                         ; 0809FDD8
neg   r1,r1                         ; 0809FDDA
cmp   r2,0x0                        ; 0809FDDC
beq   @@Code0809FDE2                ; 0809FDDE
sub   r1,0x1                        ; 0809FDE0
@@Code0809FDE2:
mov   r4,r1                         ; 0809FDE2
mov   r1,r4                         ; 0809FDE4
mov   r0,r3                         ; 0809FDE6
pop   {r4,pc}                       ; 0809FDE8
.pool                               ; 0809FDEA

Sub0809FDEC:
push  {r4-r5,lr}                    ; 0809FDEC
mov   r5,r0                         ; 0809FDEE
mov   r4,r5                         ; 0809FDF0
mov   r3,r1                         ; 0809FDF2
cmp   r2,0xF                        ; 0809FDF4
bls   @@Code0809FE2C                ; 0809FDF6
mov   r0,r3                         ; 0809FDF8
orr   r0,r5                         ; 0809FDFA
mov   r1,0x3                        ; 0809FDFC
and   r0,r1                         ; 0809FDFE
cmp   r0,0x0                        ; 0809FE00
bne   @@Code0809FE2C                ; 0809FE02
mov   r1,r5                         ; 0809FE04
@@Code0809FE06:
ldmia r3!,{r0}                      ; 0809FE06
stmia r1!,{r0}                      ; 0809FE08
ldmia r3!,{r0}                      ; 0809FE0A
stmia r1!,{r0}                      ; 0809FE0C
ldmia r3!,{r0}                      ; 0809FE0E
stmia r1!,{r0}                      ; 0809FE10
ldmia r3!,{r0}                      ; 0809FE12
stmia r1!,{r0}                      ; 0809FE14
sub   r2,0x10                       ; 0809FE16
cmp   r2,0xF                        ; 0809FE18
bhi   @@Code0809FE06                ; 0809FE1A
cmp   r2,0x3                        ; 0809FE1C
bls   @@Code0809FE2A                ; 0809FE1E
@@Code0809FE20:
ldmia r3!,{r0}                      ; 0809FE20
stmia r1!,{r0}                      ; 0809FE22
sub   r2,0x4                        ; 0809FE24
cmp   r2,0x3                        ; 0809FE26
bhi   @@Code0809FE20                ; 0809FE28
@@Code0809FE2A:
mov   r4,r1                         ; 0809FE2A
@@Code0809FE2C:
sub   r2,0x1                        ; 0809FE2C
mov   r0,0x1                        ; 0809FE2E
neg   r0,r0                         ; 0809FE30
cmp   r2,r0                         ; 0809FE32
beq   @@Code0809FE46                ; 0809FE34
mov   r1,r0                         ; 0809FE36
@@Code0809FE38:
ldrb  r0,[r3]                       ; 0809FE38
strb  r0,[r4]                       ; 0809FE3A
add   r3,0x1                        ; 0809FE3C
add   r4,0x1                        ; 0809FE3E
sub   r2,0x1                        ; 0809FE40
cmp   r2,r1                         ; 0809FE42
bne   @@Code0809FE38                ; 0809FE44
@@Code0809FE46:
mov   r0,r5                         ; 0809FE46
pop   {r4-r5,pc}                    ; 0809FE48
.pool                               ; 0809FE4A
