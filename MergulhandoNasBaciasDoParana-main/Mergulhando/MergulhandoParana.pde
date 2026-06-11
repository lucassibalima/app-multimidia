//tela 0 é a tela principal_geral
//tela 1 é a tela pincipal_rios
//tela 2 é a tela principal_territorio
//tela 3 é a tela principal_???
//tela 4 é a tela RI_1
//tela 5 é a tela BRL_1
//tela 6 é a tela BL_1
//tela 7 é a tela BARP_1

//tela 8 blcaract - 9 blbio - 10  blimpor
//tela 11 brlcaract  - 12 brlbio - 13 brlimpor
//tela 14 barpcaract - 15 barpbio - 16 barpimpor
//tela 17 ricaract - 18 ribio - 19 riimpor

//telarioiguacu; 20
//telarioivai; 21
//telariomarumbi; 22
//telarionhundiaquara; 23
//telarionunes; 24
//telarioparana; 25
//telariopiquiri; 26
//telariotibagi; 27
//telariotubatao; 28

// 3D

import peasy.*;

PeasyCam cam;

PShape Parana;

PShape ParanaBuffer;

//============

int tela = 0;

//botao de abrir o menu
boolean menuAberto = false;
boolean botaoVoltar = false;
boolean botaoVoltarUM = false;
boolean botaoVoltarBL = false;
boolean botaoVoltarBRL = false;
boolean botaoVoltarBARP = false;
boolean botaoVoltarRI = false;
boolean EscalaAtivada = false;

float ZEscala = 1;

//imagens usadas nas "telas"
PImage img;
PImage imgLitoral;
PImage imgBLcaract;
PImage imgBLbio;
PImage imgBLimpor;


PImage imgRioIguaçu;
PImage imgBRLcaract;
PImage imgBRLbio;
PImage imgBRLimpor;

PImage imgRioParana;
PImage imgBARPcaract;
PImage imgBARPbio;
PImage imgBARPimpor;

PImage imgRioInterior;
PImage imgRIcaract;
PImage imgRIbio;
PImage imgRIimpor;

PImage imgParana2imagem;


//imagens rio
PImage telarioiguacu;
PImage telarioivai;
PImage telariomarumbi;
PImage telarionhundiaquara;
PImage telarionunes;
PImage telarioparana;
PImage telariopiquiri;
PImage telariotibagi;
PImage telariotubatao;

PImage BaciasBotao;
PImage RiosBotao;
PImage Relevo3DBotao;

//coordenadas do mapa do Paraná
float[] xRegiaoBARP = {536, 536, 531, 526, 521, 516, 511, 506, 501, 497, 493, 489, 486, 483, 480, 479, 478, 478, 478, 478, 478, 479, 482, 486, 487, 490, 490, 489, 484, 480, 475, 470, 465, 461, 456, 451, 446, 442, 440, 440, 439, 437, 434, 430, 426, 425, 422, 418, 414, 410, 409, 406, 406, 403, 401, 401, 401, 401, 401, 401, 401, 405, 408, 409, 409, 404, 398, 392, 386, 380, 374, 369, 364, 358, 353, 348, 343, 339, 333, 327, 321, 316, 311, 306, 300, 294, 288, 284, 279, 273, 267, 261, 258, 257, 252, 248, 243, 240, 235, 229, 224, 219, 214, 208, 203, 202, 198, 194, 190, 190, 187, 182, 177, 174, 170, 166, 162, 157, 152, 146, 142, 138, 136, 132, 129, 127, 126, 125, 124, 120, 118, 114, 109, 107, 105, 103, 102, 98, 97, 92, 91, 91, 91, 92, 93, 91, 87, 86, 83, 84, 84, 85, 88, 93, 98, 102, 108, 114, 118, 122, 126, 131, 137, 143, 149, 155, 161, 166, 168, 172, 178, 182, 186, 191, 197, 203, 209, 214, 219, 221, 226, 232, 238, 244, 250, 254, 258, 264, 270, 275, 280, 286, 292, 298, 304, 309, 310, 315, 320, 325, 330, 335, 340, 345, 350, 355, 360, 366, 372, 377, 383, 389, 395, 399, 404, 409, 415, 421, 428, 433, 439, 445, 451, 456, 462, 466, 471, 476, 481, 487, 493, 498, 503, 508, 513, 519, 525, 530, 534};
float[] yRegiaoBARP = {381, 375, 372, 370, 369, 368, 366, 362, 358, 354, 350, 346, 341, 336, 331, 326, 321, 315, 309, 303, 297, 292, 287, 282, 277, 272, 266, 261, 257, 252, 249, 246, 243, 239, 235, 231, 227, 222, 217, 211, 206, 201, 196, 192, 188, 183, 178, 174, 170, 166, 161, 156, 150, 144, 139, 133, 127, 121, 115, 109, 103, 99, 94, 89, 83, 82, 81, 81, 81, 81, 81, 80, 79, 78, 77, 78, 81, 85, 85, 84, 84, 85, 84, 83, 83, 83, 83, 88, 90, 90, 90, 90, 95, 100, 102, 107, 108, 113, 114, 114, 117, 120, 122, 122, 125, 130, 134, 138, 142, 148, 153, 155, 157, 162, 166, 170, 175, 178, 179, 180, 184, 188, 193, 197, 202, 207, 212, 217, 222, 226, 231, 235, 238, 243, 248, 253, 258, 262, 267, 270, 275, 281, 287, 292, 297, 302, 306, 311, 316, 321, 327, 332, 337, 339, 341, 345, 345, 345, 349, 353, 358, 361, 362, 362, 362, 362, 362, 365, 370, 374, 374, 378, 383, 384, 384, 384, 384, 383, 384, 389, 390, 390, 390, 390, 390, 394, 398, 400, 400, 401, 402, 402, 402, 402, 402, 400, 395, 394, 392, 391, 390, 388, 386, 384, 383, 380, 378, 378, 379, 380, 380, 380, 379, 375, 374, 373, 373, 374, 374, 375, 375, 375, 375, 372, 372, 376, 378, 379, 380, 380, 380, 382, 383, 384, 385, 385, 385, 384, 380};

float[] xRegiaoBL = {821, 822, 823, 828, 834, 839, 842, 843, 843, 845, 849, 854, 859, 865, 871, 876, 877, 877, 880, 885, 890, 895, 900, 905, 906, 910, 912, 914, 918, 923, 929, 935, 940, 946, 952, 958, 963, 968, 970, 966, 967, 964, 962, 967, 972, 978, 983, 988, 993, 997, 1002, 1008, 1010, 1010, 1013, 1017, 1022, 1027, 1032, 1038, 1044, 1048, 1046, 1042, 1042, 1041, 1036, 1031, 1026, 1023, 1024, 1024, 1019, 1015, 1011, 1012, 1012, 1009, 1004, 1000, 998, 995, 994, 994, 993, 988, 983, 978, 975, 972, 971, 969, 966, 962, 961, 960, 958, 956, 953, 950, 950, 946, 945, 944, 943, 942, 941, 941, 936, 932, 927, 921, 915, 910, 904, 898, 893, 892, 891, 886, 880, 874, 869, 864, 859, 854, 849, 844, 838, 833, 828, 824, 823, 823, 824, 827, 830, 832, 832, 834, 837, 835, 833, 832, 832, 832, 832, 828, 823, 822, 822, 821, 820, 818, 815, 813, 810, 812, 814, 817, 820, 824, 828, 827, 823};
float[] yRegiaoBL = {446, 441, 436, 433, 431, 429, 424, 419, 413, 408, 404, 401, 398, 398, 398, 397, 392, 386, 381, 378, 375, 372, 370, 367, 362, 358, 353, 348, 344, 341, 341, 342, 345, 345, 344, 344, 346, 347, 352, 357, 362, 367, 372, 374, 376, 376, 373, 370, 371, 375, 378, 378, 383, 389, 394, 398, 399, 401, 399, 399, 399, 403, 408, 413, 419, 424, 426, 427, 430, 435, 440, 446, 449, 453, 457, 463, 469, 474, 476, 481, 486, 491, 496, 502, 508, 512, 515, 517, 522, 527, 532, 537, 542, 546, 551, 556, 561, 566, 571, 576, 582, 586, 591, 596, 601, 606, 611, 617, 619, 623, 625, 625, 625, 626, 626, 626, 625, 620, 615, 614, 614, 614, 615, 618, 616, 615, 618, 620, 620, 618, 617, 613, 608, 602, 597, 591, 586, 581, 575, 570, 565, 560, 555, 550, 544, 538, 532, 528, 526, 521, 515, 510, 505, 500, 495, 490, 485, 480, 475, 470, 465, 461, 456, 451, 447};

float[] xRegiaoBRL = {27, 26, 26, 27, 30, 34, 37, 42, 44, 46, 46, 46, 46, 46, 45, 44, 47, 51, 54, 58, 61, 61, 61, 62, 62, 62, 62, 66, 71, 74, 74, 74, 74, 74, 74, 74, 76, 80, 85, 91, 97, 100, 105, 111, 117, 118, 123, 127, 132, 137, 142, 148, 154, 159, 165, 168, 172, 178, 182, 187, 192, 198, 204, 210, 216, 220, 225, 231, 236, 242, 248, 254, 259, 264, 269, 275, 281, 285, 290, 296, 302, 307, 312, 317, 321, 325, 331, 337, 342, 346, 351, 357, 363, 369, 375, 381, 387, 393, 398, 402, 407, 413, 418, 423, 428, 434, 442, 448, 452, 458, 464, 468, 473, 478, 484, 490, 495, 501, 507, 512, 517, 522, 527, 533, 539, 545, 551, 557, 561, 566, 572, 578, 584, 589, 592, 597, 602, 606, 607, 610, 614, 617, 615, 614, 612, 611, 616, 622, 628, 633, 634, 640, 646, 652, 657, 662, 667, 671, 676, 682, 688, 694, 698, 704, 709, 714, 719, 723, 728, 734, 740, 745, 750, 755, 761, 766, 771, 776, 781, 787, 793, 799, 804, 810, 814, 819, 825, 827, 827, 823, 820, 816, 811, 809, 809, 809, 814, 815, 817, 817, 818, 822, 827, 830, 830, 830, 830, 829, 829, 833, 834, 831, 830, 828, 826, 823, 822, 821, 822, 823, 819, 817, 812, 807, 803, 801, 797, 791, 785, 780, 774, 768, 763, 760, 754, 748, 743, 738, 733, 728, 723, 718, 713, 709, 704, 702, 697, 692, 686, 681, 676, 672, 666, 661, 657, 652, 649, 643, 637, 631, 625, 620, 614, 609, 606, 601, 596, 594, 589, 583, 578, 577, 572, 566, 560, 554, 550, 545, 540, 537, 533, 527, 521, 516, 510, 508, 505, 500, 494, 488, 482, 478, 473, 468, 463, 457, 452, 446, 440, 435, 430, 426, 422, 417, 411, 406, 400, 394, 388, 382, 377, 371, 366, 361, 357, 351, 346, 341, 336, 331, 325, 319, 314, 308, 303, 298, 294, 290, 284, 280, 276, 272, 267, 261, 256, 250, 245, 239, 233, 229, 225, 221, 215, 210, 203, 198, 193, 188, 183, 178, 173, 168, 163, 157, 152, 147, 142, 137, 131, 126, 121, 119, 117, 117, 118, 118, 114, 109, 104, 98, 92, 86, 80, 74, 68, 63, 58, 58, 58, 54, 49, 43, 37, 32, 29};
float[] yRegiaoBRL = {534, 529, 523, 518, 513, 509, 504, 501, 496, 491, 485, 479, 473, 467, 462, 457, 452, 448, 443, 439, 434, 428, 422, 417, 411, 405, 399, 395, 391, 386, 380, 374, 368, 362, 356, 350, 345, 341, 339, 339, 339, 344, 346, 346, 346, 351, 355, 359, 361, 363, 365, 365, 365, 366, 367, 372, 376, 376, 380, 383, 385, 385, 385, 385, 385, 389, 392, 392, 393, 393, 393, 394, 398, 400, 401, 401, 401, 405, 406, 406, 406, 403, 401, 398, 394, 390, 390, 390, 388, 384, 381, 381, 381, 381, 381, 381, 381, 381, 380, 376, 375, 375, 376, 377, 378, 378, 378, 378, 374, 374, 374, 378, 380, 381, 381, 381, 383, 386, 386, 387, 388, 387, 384, 384, 384, 384, 384, 384, 388, 390, 390, 390, 390, 392, 397, 398, 399, 404, 409, 414, 418, 423, 428, 433, 438, 443, 446, 446, 446, 445, 440, 440, 440, 440, 441, 442, 445, 449, 450, 450, 450, 450, 446, 446, 447, 451, 454, 458, 459, 459, 459, 460, 462, 465, 465, 463, 461, 460, 459, 459, 459, 459, 458, 458, 454, 452, 452, 457, 463, 467, 472, 476, 480, 485, 491, 497, 501, 506, 511, 517, 522, 526, 527, 532, 538, 544, 550, 555, 561, 566, 571, 576, 581, 586, 591, 596, 601, 606, 611, 616, 620, 625, 628, 630, 634, 639, 643, 643, 643, 640, 640, 640, 638, 633, 633, 633, 634, 637, 638, 636, 633, 631, 629, 625, 622, 617, 616, 614, 614, 612, 609, 605, 605, 607, 611, 615, 620, 620, 620, 620, 620, 623, 623, 621, 616, 615, 617, 622, 623, 623, 624, 629, 630, 630, 630, 630, 634, 637, 639, 644, 648, 648, 648, 646, 646, 641, 636, 635, 635, 635, 635, 631, 630, 629, 627, 627, 630, 630, 628, 627, 629, 625, 621, 618, 618, 617, 617, 617, 617, 617, 618, 618, 617, 614, 610, 610, 609, 606, 602, 601, 601, 601, 602, 602, 601, 598, 594, 590, 590, 586, 582, 578, 576, 576, 575, 575, 578, 578, 578, 574, 570, 566, 566, 564, 564, 567, 569, 568, 565, 564, 561, 557, 556, 556, 558, 560, 563, 565, 565, 564, 561, 556, 551, 545, 540, 534, 529, 526, 524, 524, 524, 524, 524, 524, 524, 521, 522, 528, 534, 538, 539, 539, 539, 538, 533};

float[] xRegiaoRI = {413, 408, 404, 401, 398, 397, 396, 396, 395, 395, 394, 394, 394, 395, 397, 397, 400, 403, 408, 414, 418, 422, 424, 424, 429, 434, 434, 434, 436, 440, 443, 448, 451, 455, 459, 463, 468, 473, 478, 482, 487, 493, 493, 494, 494, 490, 485, 480, 478, 478, 477, 477, 477, 477, 477, 479, 480, 480, 482, 486, 490, 494, 498, 503, 508, 514, 518, 520, 523, 526, 531, 536, 541, 546, 551, 557, 563, 569, 575, 581, 586, 587, 592, 597, 602, 604, 608, 611, 616, 620, 622, 617, 612, 612, 612, 616, 621, 626, 631, 633, 638, 644, 650, 656, 661, 666, 671, 676, 682, 688, 693, 699, 705, 710, 714, 719, 723, 726, 731, 737, 743, 748, 754, 760, 765, 770, 774, 780, 785, 790, 795, 801, 806, 811, 815, 817, 818, 820, 821, 826, 832, 837, 837, 838, 843, 845, 848, 853, 859, 864, 870, 875, 877, 877, 878, 883, 887, 892, 897, 902, 908, 910, 911, 912, 914, 919, 923, 918, 912, 906, 901, 896, 890, 884, 881, 878, 878, 878, 878, 883, 885, 886, 887, 888, 883, 878, 873, 869, 865, 862, 861, 856, 850, 846, 844, 840, 836, 838, 839, 839, 839, 842, 839, 835, 835, 835, 835, 837, 837, 837, 836, 832, 827, 822, 821, 820, 818, 813, 808, 803, 798, 792, 786, 783, 778, 775, 775, 770, 763, 757, 752, 747, 741, 736, 731, 725, 719, 714, 709, 703, 697, 692, 687, 681, 675, 670, 665, 660, 655, 650, 645, 641, 636, 630, 626, 622, 621, 616, 613, 608, 602, 596, 591, 586, 581, 576, 570, 565, 559, 554, 550, 545, 539, 534, 528, 522, 517, 511, 505, 499, 494, 489, 483, 477, 472, 467, 461, 455, 450, 446, 442, 436, 430, 424, 419, 418, 418, 414};
float[] yRegiaoRI = {87, 89, 93, 98, 103, 108, 113, 119, 124, 130, 135, 141, 147, 152, 157, 163, 168, 173, 174, 175, 179, 183, 188, 194, 196, 199, 205, 211, 216, 221, 226, 227, 232, 236, 240, 244, 245, 246, 249, 253, 254, 257, 263, 268, 274, 278, 282, 283, 288, 294, 299, 305, 311, 317, 323, 328, 333, 339, 344, 348, 352, 356, 360, 362, 363, 363, 367, 372, 377, 382, 383, 385, 386, 388, 390, 390, 390, 390, 390, 390, 391, 396, 399, 400, 402, 407, 412, 417, 418, 424, 429, 432, 434, 440, 446, 450, 451, 452, 451, 446, 443, 443, 443, 443, 445, 446, 447, 449, 449, 449, 446, 446, 446, 447, 451, 455, 459, 464, 465, 465, 465, 466, 466, 466, 465, 462, 458, 457, 459, 462, 464, 464, 461, 458, 454, 449, 444, 439, 434, 432, 432, 430, 423, 418, 415, 410, 405, 404, 404, 402, 402, 400, 395, 389, 384, 381, 377, 374, 370, 366, 364, 359, 354, 349, 344, 342, 338, 337, 337, 337, 338, 339, 339, 339, 334, 329, 323, 317, 311, 308, 303, 298, 293, 288, 286, 285, 282, 278, 274, 269, 263, 260, 260, 256, 251, 246, 242, 237, 232, 226, 220, 215, 210, 206, 200, 194, 188, 183, 177, 171, 166, 162, 160, 158, 153, 148, 143, 140, 137, 135, 134, 134, 134, 129, 128, 123, 117, 114, 114, 114, 115, 116, 116, 117, 118, 118, 118, 120, 122, 122, 122, 118, 117, 117, 118, 120, 118, 117, 116, 113, 115, 119, 122, 122, 118, 114, 109, 106, 101, 100, 100, 100, 98, 97, 94, 91, 91, 93, 93, 90, 86, 85, 85, 84, 84, 84, 86, 86, 86, 86, 83, 82, 82, 82, 83, 81, 81, 81, 78, 74, 70, 70, 70, 70, 71, 76, 82, 86};


//coordenadas dos rios
float[] xriopiraqui = { 186, 190, 194, 202, 210, 218, 226, 235, 242, 246, 253, 261, 269, 277, 280, 288, 294, 302, 310, 318, 328, 338, 344, 349, 355, 363, 371, 379, 384, 392, 402, 410, 418, 427, 435, 442, 448, 451, 459, 467, 477, 485, 491, 501, 510, 518, 525, 533, 542, 539, 533, 525, 517, 509, 501, 493, 485, 477, 474, 466, 458, 450, 443, 437, 430, 421, 411, 402, 392, 384, 378, 370, 362, 352, 344, 338, 333, 325, 315, 306, 298, 290, 282, 275, 269, 262, 256, 248, 238, 232, 227, 219, 211, 203, 195, 186, 178, 173, 165, 163, 163, 171, 179};
float[] yriopiraqui = { 220, 226, 232, 233, 234, 233, 229, 229, 234, 240, 245, 246, 242, 245, 251, 254, 259, 263, 262, 259, 259, 259, 264, 270, 275, 277, 278, 280, 286, 289, 289, 288, 287, 287, 288, 293, 298, 304, 307, 311, 311, 313, 318, 318, 318, 314, 310, 307, 307, 313, 318, 320, 323, 326, 330, 331, 332, 330, 324, 323, 322, 319, 313, 307, 302, 302, 302, 302, 302, 300, 295, 292, 289, 289, 288, 283, 277, 274, 274, 274, 275, 277, 276, 271, 266, 262, 257, 256, 256, 251, 245, 242, 244, 247, 250, 250, 246, 240, 238, 232, 224, 221, 217};


float[] xrioivai = {242, 246, 254, 262, 270, 277, 285, 294, 301, 309, 317, 325, 333, 341, 346, 355, 363, 371, 379, 384, 392, 400, 410, 413, 421, 430, 438, 448, 456, 461, 467, 470, 472, 480, 488, 498, 507, 514, 517, 523, 531, 539, 546, 554, 560, 563, 566, 573, 579, 587, 595, 603, 611, 614, 618, 624, 632, 640, 643, 650, 656, 659, 662, 664, 666, 669, 674, 675, 670, 667, 667, 669, 672, 678, 682, 680, 682, 688, 694, 701, 706, 707, 707, 709, 710, 710, 717, 725, 733, 733, 733, 741, 749, 758, 768, 778, 784, 782, 781, 773, 765, 757, 747, 739, 731, 725, 720, 720, 714, 707, 699, 693, 691, 690, 690, 691, 691, 683, 675, 670, 670, 667, 662, 656, 651, 651, 651, 648, 646, 646, 646, 646, 648, 648, 646, 643, 637, 629, 621, 616, 613, 606, 598, 590, 581, 571, 563, 557, 555, 549, 547, 539, 530, 522, 515, 509, 507, 499, 491, 483, 477, 470, 464, 462, 454, 448, 440, 432, 424, 414, 406, 402, 395, 387, 379, 370, 362, 354, 346, 338, 328, 318, 312, 304, 296, 286, 278, 270, 262, 253, 245};
float[] yrioivai = {131, 125, 122, 121, 119, 114, 112, 112, 116, 115, 113, 109, 106, 107, 113, 113, 110, 108, 107, 113, 116, 118, 118, 124, 128, 128, 127, 127, 130, 136, 142, 148, 154, 157, 158, 158, 158, 163, 169, 174, 178, 179, 184, 187, 192, 198, 204, 209, 214, 212, 210, 212, 216, 222, 228, 234, 235, 238, 244, 248, 253, 259, 265, 271, 277, 283, 289, 295, 301, 307, 314, 320, 326, 331, 337, 343, 349, 355, 360, 365, 371, 377, 384, 390, 396, 403, 408, 409, 413, 420, 427, 430, 431, 431, 431, 431, 436, 442, 448, 451, 452, 454, 454, 452, 451, 446, 440, 433, 428, 424, 420, 415, 409, 403, 396, 390, 383, 379, 376, 370, 362, 356, 350, 346, 340, 332, 325, 319, 313, 306, 299, 292, 284, 277, 271, 265, 260, 257, 253, 247, 241, 236, 232, 230, 230, 230, 227, 222, 216, 211, 205, 203, 203, 200, 196, 191, 185, 181, 180, 178, 173, 168, 163, 157, 154, 149, 146, 144, 143, 143, 140, 134, 130, 128, 127, 127, 126, 125, 124, 121, 121, 121, 126, 130, 132, 132, 133, 136, 137, 137, 133};

float[] xrioparnaa = {82, 90, 91, 90, 83, 75, 67, 58, 53, 53, 54, 53, 51, 54, 56, 62, 69, 74, 75, 77, 77, 77, 77, 77, 77, 77, 77, 78, 85, 91, 93, 96, 101, 102, 102, 102, 102, 109, 112, 117, 120, 122, 122, 122, 118, 117, 117, 120, 123, 128, 133, 139, 147, 150, 155, 160, 166, 170, 174, 179, 179, 179, 179, 181, 187, 194, 200, 206, 214, 222, 230, 237, 240, 245, 245, 246, 248, 250, 253, 256, 262, 270, 274, 278, 286, 294, 302, 310, 317, 323, 331, 339, 347, 357, 365, 373, 381, 389, 397, 405, 406, 400, 392, 384, 376, 368, 360, 352, 342, 334, 326, 318, 310, 302, 294, 290, 283, 278, 277, 272, 267, 267, 264, 261, 256, 253, 246, 238, 232, 224, 218, 210, 203, 198, 198, 192, 189, 187, 186, 182, 178, 173, 166, 162, 157, 154, 150, 149, 149, 149, 146, 147, 147, 144, 142, 136, 131, 131, 131, 130, 130, 130, 131, 125, 120, 117, 110, 109, 107, 106, 106, 106, 106, 106, 102, 98, 96, 91, 90, 86, 85, 83, 85, 82};
float[] yrioparnaa = {463, 467, 473, 479, 484, 487, 490, 488, 482, 475, 469, 463, 457, 451, 445, 440, 436, 430, 424, 418, 410, 403, 396, 389, 382, 374, 367, 361, 356, 352, 346, 340, 334, 328, 320, 313, 306, 301, 295, 289, 283, 277, 270, 263, 257, 251, 244, 238, 232, 226, 220, 215, 211, 205, 199, 193, 188, 182, 176, 170, 163, 156, 149, 143, 138, 133, 128, 124, 120, 118, 115, 110, 104, 98, 91, 85, 79, 73, 67, 61, 56, 53, 47, 41, 36, 34, 30, 29, 24, 19, 17, 16, 13, 13, 10, 8, 6, 5, 2, 5, 12, 18, 22, 26, 29, 32, 34, 36, 37, 40, 42, 46, 49, 53, 56, 62, 67, 73, 79, 85, 91, 98, 104, 110, 116, 122, 127, 130, 134, 138, 143, 146, 152, 158, 166, 170, 176, 182, 188, 194, 200, 206, 211, 217, 223, 229, 235, 241, 248, 256, 262, 268, 275, 281, 287, 292, 298, 305, 312, 318, 325, 332, 338, 343, 349, 355, 360, 366, 373, 379, 386, 394, 401, 408, 414, 420, 426, 432, 438, 444, 450, 456, 462, 468};

float[] xriotibagi = {736, 730, 736, 742, 746, 746, 744, 744, 746, 747, 749, 754, 755, 754, 750, 754, 754, 752, 747, 746, 746, 750, 754, 758, 758, 758, 758, 762, 768, 771, 771, 773, 773, 771, 774, 778, 781, 781, 781, 784, 790, 790, 790, 790, 792, 800, 805, 805, 805, 805, 813, 819, 824, 830, 832, 832, 832, 837, 838, 842, 845, 851, 856, 858, 861, 861, 862, 861, 856, 853, 850, 846, 845, 843, 837, 834, 830, 827, 827, 827, 819, 811, 808, 808, 810, 813, 816, 818, 822, 824, 827, 834, 837, 838, 840, 845, 845, 838, 835, 832, 829, 827, 827, 826, 822, 819, 814, 806, 800, 795, 794, 792, 789, 782, 776, 774, 773, 773, 773, 771, 765, 762, 762, 762, 762, 760, 757, 755, 757, 758, 755, 750, 746, 741, 736, 734, 734, 736, 738, 738, 736, 733, 731, 731, 733, 738, 739, 741, 739, 738, 736, 734, 734, 734, 734, 734, 738};
float[] yriotibagi = {38, 34, 29, 24, 30, 37, 43, 50, 56, 62, 68, 74, 80, 86, 92, 98, 106, 112, 118, 124, 131, 137, 143, 149, 156, 163, 170, 176, 181, 187, 194, 200, 208, 214, 220, 226, 232, 239, 246, 252, 257, 264, 271, 278, 284, 288, 294, 301, 308, 316, 319, 324, 330, 335, 341, 348, 355, 361, 367, 373, 379, 384, 390, 396, 402, 409, 415, 421, 427, 433, 439, 445, 451, 457, 462, 468, 474, 480, 487, 494, 497, 494, 488, 481, 475, 469, 463, 457, 451, 445, 439, 434, 428, 422, 416, 410, 403, 398, 392, 386, 380, 374, 367, 361, 355, 349, 343, 340, 335, 329, 323, 317, 311, 306, 300, 294, 287, 280, 272, 266, 262, 256, 248, 241, 234, 228, 222, 216, 209, 203, 197, 191, 185, 179, 173, 167, 160, 154, 148, 140, 134, 128, 122, 115, 109, 103, 97, 91, 85, 79, 73, 67, 60, 53, 46, 38, 32};

float[] xrioiguacu = {773, 779, 782, 790, 792, 790, 784, 778, 771, 762, 752, 746, 742, 733, 731, 730, 723, 714, 706, 699, 693, 686, 688, 686, 682, 675, 669, 661, 651, 643, 635, 627, 618, 608, 606, 608, 616, 622, 627, 634, 632, 630, 630, 632, 640, 642, 642, 642, 635, 632, 630, 630, 635, 635, 635, 632, 624, 618, 618, 614, 610, 610, 611, 616, 616, 619, 619, 613, 610, 608, 608, 608, 610, 610, 605, 602, 595, 589, 584, 578, 573, 568, 560, 552, 544, 538, 533, 525, 517, 509, 501, 493, 485, 478, 470, 462, 454, 446, 437, 429, 421, 413, 405, 395, 386, 378, 370, 362, 354, 346, 339, 333, 325, 317, 310, 302, 296, 286, 277, 269, 261, 253, 243, 235, 227, 219, 211, 203, 195, 186, 176, 168, 163, 154, 146, 142, 136, 128, 123, 115, 106, 99, 91, 82, 72, 66, 61, 59, 64, 72, 78, 90, 98, 106, 114, 122, 130, 138, 147, 155, 163, 171, 178, 186, 195, 205, 213, 221, 229, 238, 248, 256, 264, 270, 278, 288, 296, 304, 312, 320, 328, 338, 346, 352, 358, 365, 373, 381, 390, 398, 406, 414, 421, 430, 438, 448, 456, 464, 472, 482, 491, 499, 506, 512, 520, 528, 534, 541, 547, 555, 563, 571, 578, 582, 589, 597, 605, 613, 621, 630, 640, 648, 658, 666, 670, 672, 677, 683, 690, 698, 706, 714, 720, 728, 731, 736, 746, 754, 760, 768, 776};
float[] yrioiguacu = {485, 480, 474, 475, 481, 487, 492, 497, 502, 502, 502, 497, 491, 491, 497, 503, 508, 508, 509, 514, 518, 523, 529, 535, 541, 546, 551, 553, 553, 552, 551, 548, 548, 548, 554, 560, 564, 569, 575, 580, 587, 593, 600, 606, 611, 617, 624, 631, 636, 642, 648, 655, 661, 668, 676, 682, 684, 679, 672, 666, 660, 653, 647, 641, 634, 628, 620, 616, 610, 604, 596, 589, 582, 575, 569, 563, 557, 552, 546, 541, 535, 529, 526, 524, 527, 522, 516, 512, 509, 508, 505, 503, 499, 494, 492, 491, 487, 484, 484, 487, 491, 492, 493, 493, 493, 491, 487, 482, 481, 476, 472, 467, 464, 463, 468, 472, 476, 476, 476, 474, 470, 468, 468, 472, 475, 479, 481, 482, 484, 484, 484, 480, 474, 474, 476, 482, 487, 486, 480, 476, 476, 481, 484, 484, 484, 479, 473, 467, 461, 460, 464, 464, 463, 461, 458, 460, 462, 463, 463, 460, 456, 455, 460, 461, 461, 461, 458, 457, 456, 456, 456, 455, 454, 458, 460, 460, 456, 452, 449, 448, 446, 446, 449, 454, 458, 463, 467, 468, 468, 469, 473, 472, 467, 467, 466, 466, 470, 474, 475, 475, 475, 478, 482, 487, 488, 490, 494, 499, 504, 505, 506, 508, 512, 518, 523, 527, 528, 532, 534, 534, 534, 532, 532, 530, 524, 518, 512, 508, 503, 500, 497, 493, 488, 487, 481, 475, 475, 478, 482, 484, 482};

float[] xrionhundiaria = {1186, 1179, 1173, 1165, 1155, 1152, 1149, 1142, 1136, 1128, 1123, 1123, 1125, 1126, 1122, 1114, 1109, 1107, 1101, 1093, 1085, 1077, 1069, 1061, 1053, 1045, 1037, 1029, 1021, 1013, 1005, 997, 989, 981, 973, 965, 957, 952, 946, 939, 931, 923, 920, 912, 904, 896, 888, 882, 874, 866, 864, 872, 882, 883, 891, 899, 902, 909, 917, 925, 933, 942, 950, 958, 965, 973, 981, 990, 1000, 1010, 1019, 1029, 1038, 1048, 1056, 1066, 1075, 1085, 1093, 1099, 1107, 1114, 1117, 1117, 1117, 1117, 1125, 1133, 1136, 1139, 1146, 1154, 1162, 1168, 1171, 1179, 1189, 1194, 1186, 1178};
float[] yrionhundiaria = {448, 443, 438, 434, 434, 428, 422, 418, 413, 410, 404, 397, 391, 385, 379, 378, 372, 366, 361, 360, 362, 365, 361, 359, 358, 360, 362, 358, 354, 355, 356, 358, 354, 355, 358, 356, 359, 365, 370, 374, 376, 372, 366, 361, 359, 358, 359, 364, 368, 372, 378, 382, 382, 376, 373, 372, 378, 383, 384, 388, 390, 390, 386, 382, 377, 373, 371, 371, 371, 371, 371, 371, 371, 371, 372, 372, 372, 372, 374, 379, 383, 388, 394, 401, 408, 415, 419, 422, 428, 434, 440, 443, 444, 450, 456, 457, 456, 450, 446, 444};

float[] xriocubatao = {1120, 1110, 1101, 1093, 1085, 1075, 1067, 1059, 1051, 1043, 1035, 1027, 1019, 1010, 1002, 992, 984, 976, 970, 963, 955, 949, 942, 938, 930, 922, 914, 907, 899, 891, 883, 875, 872, 864, 858, 850, 845, 842, 840, 842, 846, 853, 861, 870, 878, 886, 891, 898, 891, 883, 875, 867, 862, 864, 872, 882, 890, 898, 906, 912, 918, 925, 933, 942, 949, 954, 960, 966, 974, 982, 990, 998, 1006, 1016, 1026, 1035, 1045, 1053, 1056, 1062, 1069, 1077, 1085, 1093, 1102, 1112, 1120, 1128, 1126, 1118};
float[] yriocubatao = {410, 410, 410, 412, 413, 413, 415, 418, 420, 424, 427, 430, 428, 428, 426, 426, 427, 430, 434, 439, 443, 448, 452, 458, 462, 463, 466, 470, 474, 475, 476, 480, 486, 490, 494, 497, 503, 509, 515, 521, 527, 532, 534, 534, 535, 534, 528, 523, 518, 516, 520, 518, 512, 506, 504, 504, 502, 499, 496, 491, 486, 481, 479, 478, 472, 466, 461, 456, 452, 450, 448, 446, 445, 445, 445, 445, 445, 446, 440, 436, 431, 428, 426, 425, 425, 425, 424, 421, 415, 412};

float[] xriomarumbi = {1059, 1051, 1043, 1037, 1043, 1051, 1059, 1067, 1069, 1077, 1086, 1096, 1104, 1112, 1115, 1123, 1131, 1139, 1147, 1152, 1158, 1168, 1171, 1165, 1163, 1162, 1154, 1144, 1136, 1128, 1125, 1117, 1109, 1101, 1091, 1083, 1075, 1069, 1062};
float[] yriomarumbi = {430, 431, 433, 438, 443, 446, 448, 450, 456, 457, 457, 457, 455, 451, 457, 461, 462, 463, 467, 473, 479, 479, 473, 468, 462, 456, 455, 455, 452, 449, 443, 439, 442, 445, 445, 442, 438, 433, 428};

float[] xrionunes = {1146, 1138, 1130, 1122, 1112, 1102, 1093, 1085, 1077, 1069, 1061, 1053, 1045, 1037, 1027, 1019, 1013, 1006, 1005, 1003, 997, 989, 981, 974, 966, 958, 950, 942, 934, 928, 920, 910, 907, 910, 918, 926, 928, 936, 946, 955, 963, 971, 978, 986, 995, 1005, 1013, 1021, 1016, 1018, 1024, 1026, 1034, 1043, 1051, 1059, 1069, 1077, 1085, 1094, 1102, 1112, 1120, 1126, 1133, 1141, 1147};
float[] yrionunes = {493, 494, 496, 494, 494, 494, 494, 498, 499, 500, 502, 500, 498, 496, 496, 498, 504, 509, 515, 521, 526, 528, 527, 522, 521, 522, 524, 523, 520, 515, 512, 514, 520, 526, 528, 530, 536, 539, 539, 539, 535, 534, 539, 541, 541, 541, 540, 538, 532, 524, 520, 514, 512, 512, 515, 517, 517, 512, 511, 511, 512, 512, 511, 506, 502, 500, 494};

void setup() {
  size(1280, 720,P3D);
  img = loadImage("bacias_hidrograficas.png");
  imgLitoral = loadImage("bacia h litoral.png");
  imgRioIguaçu = loadImage("bacia do rio iguacu.png");
  imgRioParana = loadImage("bacia do rio parana.png");
  imgRioInterior = loadImage("bacias dos rios do interior.png");
  imgParana2imagem = loadImage("RiosParana.png");
  imgBLcaract = loadImage("riolitoralcaracteristicas.png");
  imgBLbio = loadImage("riolitoralbiodiversidade.png");
  
  imgBLimpor= loadImage("riolitoralimportancia.png");
  
  imgBRLcaract = loadImage("rioiguacucaracteristicas.png");
  imgBRLbio = loadImage("rioiguacubiodiversidade.png");
  imgBRLimpor = loadImage("rioiguacuimportancia.png");
  imgBARPimpor = loadImage("riolitoralimportancia.png");
  imgBARPcaract = loadImage("rioparanacaracteristicas.png");
  imgBARPbio = loadImage("rioparanabiodiversidade.png");
  imgBARPimpor = loadImage("rioparanaimportancia.png");
  imgRIcaract = loadImage("riointeriorcaracteristicas.png");
  imgRIbio = loadImage("riointeriorbiodiversidade.png");
  imgRIimpor = loadImage("riointeriorimportancia.png");
  telarioiguacu = loadImage("telarioiguacu.png");
  telarioivai = loadImage("telarioivai.png");
  telariomarumbi = loadImage("telariomarumbi.png");
  telarionhundiaquara = loadImage("telarionhundiaquara.png");
  telarionunes = loadImage("telarionunes.png");
  telarioparana = loadImage("telarioparana.png");
  telariopiquiri = loadImage("telariopiquiri.png");
  telariotibagi = loadImage("telariotibagi.png");
  telariotubatao = loadImage("telariotubatao.png");
  
  
  BaciasBotao = loadImage("ui/BACIAS.png");
  RiosBotao = loadImage("ui/RIOS.png");
  Relevo3DBotao = loadImage("ui/RELEVO.png");

  
  Parana = loadShape("models/parana.obj");
  ParanaBuffer = loadShape("models/parana_lowres.obj");
  
  cam = new PeasyCam(this, width/2, height/2, -50 , 500);
  cam.setMinimumDistance(25);
  cam.setMaximumDistance(674);
  cam.setDistance(674);
  
  cam.setActive(false);
  

}

void tela_zero () {
    if (tela == 0) {
      background(255);
      
      image(img, 0, 0, width, height  );
      //botao menu
      if (menuAberto == false) {
      desenhar_botaoMenu ();
      }
    
      //menu 
      if (menuAberto) {
        desenharMenu();      
        }

      if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xRegiaoBL, yRegiaoBL)) {

        noFill();
        stroke(0);
        strokeWeight(6);

        beginShape();
        for (int i = 0; i < xRegiaoBL.length; i++) {
          vertex(xRegiaoBL[i], yRegiaoBL[i]);
        }
        endShape(CLOSE);
      }
      if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xRegiaoBRL, yRegiaoBRL)) {
        
        noFill();
        stroke(0);
        strokeWeight(6);

        beginShape();
        for (int i = 0; i < xRegiaoBRL.length; i++) {
          vertex(xRegiaoBRL[i], yRegiaoBRL[i]);
        }
        endShape(CLOSE);
      }
      if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xRegiaoBARP, yRegiaoBARP)) {
        
        noFill();
        stroke(0);
        strokeWeight(6);

        beginShape();
        for (int i = 0; i < xRegiaoBARP.length; i++) {
          vertex(xRegiaoBARP[i], yRegiaoBARP[i]);
        }
        endShape(CLOSE);
      }
      if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xRegiaoRI, yRegiaoRI)) {

        noFill();
        stroke(0);
        strokeWeight(6);

        beginShape();
        for (int i = 0; i < xRegiaoRI.length; i++) {
          vertex(xRegiaoRI[i], yRegiaoRI[i]);
        }
        endShape(CLOSE);
        
      }
    }
  }

void tela_um() {

  
  if (tela == 1) {
    background(255);
    
    image(imgParana2imagem, 0, 0, width, height);

    if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xriopiraqui, yriopiraqui)) {
      desenharContorno(xriopiraqui, yriopiraqui);
    }

    if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xrioivai, yrioivai)) {
      desenharContorno(xrioivai, yrioivai);
    }

    if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xrioparnaa, yrioparnaa)) {
      desenharContorno(xrioparnaa, yrioparnaa);
    }

    if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xriotibagi, yriotibagi)) {
      desenharContorno(xriotibagi, yriotibagi);
    }

    if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xrioiguacu, yrioiguacu)) {
      desenharContorno(xrioiguacu, yrioiguacu);
    }

    if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xrionhundiaria, yrionhundiaria)) {
      desenharContorno(xrionhundiaria, yrionhundiaria);
    }

    if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xriocubatao, yriocubatao)) {
      desenharContorno(xriocubatao, yriocubatao);
    }

    if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xriomarumbi, yriomarumbi)) {
      desenharContorno(xriomarumbi, yriomarumbi);
    }

    if (!menuAberto && pontoDentroPoligono(mouseX, mouseY, xrionunes, yrionunes)) {
      desenharContorno(xrionunes, yrionunes);
    }

    if (menuAberto == false) {
      desenhar_botaoMenu();
    }

    if (menuAberto) {
      desenharMenu();
    }
  }
}

void tela_dois() {

  //tela 2 = regiao
  if (tela == 2) {
  background(255);
  fill(0);
  textSize(40);
  text("Tela maginifica :D", width/2, 100);
  
  
  //botao menu
  if (menuAberto == false) {
  desenhar_botaoMenu ();
  }
  
  //menu
  if (menuAberto) {
    desenharMenu();      
    }
  }
  
}

void tela_tres() {

  //tela 3 = 3d talvez?
  if (tela == 3) {
    
    background(255);
    perspective(PI / 3.0, (float)width / height, 0.1, 1000);
    pushMatrix();
    translate(width, height, 0);
    beginShape();
    shape(ParanaBuffer, 0, 0);
    endShape();
    popMatrix();
    
    if(IsHovered(127,127,127)){
      println("dentro");
    }

    background(255);
    directionalLight(185, 180, 180, 0.3, 1, 0);
    pushMatrix();
    translate(width, height, 0);
    scale(1,ZEscala,1);
    beginShape();
    shape(Parana, 0, 0);
    endShape();
    popMatrix();
    
  //botao menu
  if (menuAberto == false) {
  desenhar_botaoMenu ();
  }  
  
  if (menuAberto) {
    desenharMenu();      
    }
  }
  
}

void RiosDoInterior() {
  
  //tela 4
  if (tela == 4) {
    

  background(220, 240, 255);
  
  image(imgRioInterior, 0, 0, width, height);
  

  if (botaoVoltar) {
    desenhar_botaoVoltar();
    }
  }
}


void BaciaFozIguacu() {
  
  //tela 5
  if (tela == 5) {
  
  background(220, 240, 255);
  
  image(imgRioIguaçu, 0, 0, width, height);
  
  if (botaoVoltar) {
    desenhar_botaoVoltar();
    }
  }
}


void BaciasDoLitoral() {
  
  //tela 6
  if (tela == 6) {

  background(220, 240, 255);
     
  image(imgLitoral, 0, 0, width, height);
  
  if (botaoVoltar) {
    desenhar_botaoVoltar();
    }
  }
}


void BaciasDoAltoRioParana() {
  
  //tela 7
  if (tela == 7) {
  
  background(220, 240, 255);
  
  image(imgRioParana, 0, 0, width, height);
  
  if (botaoVoltar) {
    desenhar_botaoVoltar();
    }
  }
}


void BLcaract() {
  
  //tela 8
  if (tela == 8) {
    
    image(imgBLcaract, 0, 0, width, height);
    
    if (botaoVoltarBL) {
    desenhar_botaoVoltarBL();
    
    }   
  }
}

void BLbio() {
  
  //tela 9
  if (tela == 9) {
    
    image(imgBLbio, 0, 0, width, height);
    
    if (botaoVoltarBL) {
    desenhar_botaoVoltarBL();
    
    }     
  }
}

void BLimpor() {
  
  //tela 10
  if (tela == 10) {
    
    image(imgBLimpor, 0, 0, width, height);
    
    if (botaoVoltarBL) {
    desenhar_botaoVoltarBL();
    
    }    
  }
}


void BARPcaract() {   
  //tela 11
  if (tela == 11) {
    image(imgBARPcaract, 0, 0, width, height);
  
    if (botaoVoltarBARP) {
    desenhar_botaoVoltarBARP();
    }  
  }
}

void BARPbio() {
  
  //tela 12
  if (tela == 12) {
    
    image(imgBARPbio, 0, 0, width, height);
    
    if (botaoVoltarBARP) {
    desenhar_botaoVoltarBARP();
    
    }  
  }
}

void BARPimpor() {
  
  //tela 13
  if (tela == 13) {
    
    image(imgBARPimpor, 0, 0, width, height);
    
    if (botaoVoltarBARP) {
    desenhar_botaoVoltarBARP();
    
    }  
  }
}


void BRLcaract() {
  
  //tela 14
  if (tela == 14) {
    
    image(imgBRLcaract, 0, 0, width, height);
    
    if (botaoVoltarBRL) {
    desenhar_botaoVoltarBRL();
    
    }  
  }
}

void BRLbio() {
  
  //tela 15
  if (tela == 15) {
    
    image(imgBRLbio, 0, 0, width, height);
    
    if (botaoVoltarBRL) {
    desenhar_botaoVoltarBRL();
    
    }      
  }
}

void BRLimpor() {
  
  //tela 16
  if (tela == 16) {
    
    image(imgBRLimpor, 0, 0, width, height);
    
    if (botaoVoltarBRL) {
    desenhar_botaoVoltarBRL();
    
    }  
  }
}
    
    
void RIcaract() {
  
  //tela 17
  if (tela == 17) {
    
    image(imgRIcaract, 0, 0, width, height);
   
    if (botaoVoltarRI) {
      desenhar_botaoVoltarRI();
    
    }
  }
}

void RIbio() {
  
  //tela 18
  if (tela == 18) {
    
    image(imgRIbio, 0, 0, width, height);
    
    if (botaoVoltarRI) {
    desenhar_botaoVoltarRI();
    
    }  
  }
}

void RIimpor() {
  
  //tela 19
  if (tela == 19) {
    
    image(imgRIimpor, 0, 0, width, height);
    
    if (botaoVoltarRI) {
    desenhar_botaoVoltarRI();
    
    }  
  }
}



void rioiguacu() {

  //tela 20
  if (tela == 20) {
    background(255);
    image(telarioiguacu, 0, 0, width, height);
    
    if (botaoVoltarUM) {
      desenhar_botaoVoltarUM();    
    }
  }
}

void rioivai() {

  //tela 21
  if (tela == 21) {
    background(255);
    image(telarioivai, 0, 0, width, height);
    
    if (botaoVoltarUM) {
      desenhar_botaoVoltarUM();
    }
  }
}

void rionhundiaquara() {
  
  //tela 22
  if (tela == 22) {
    background(255);
    image(telarionhundiaquara, 0, 0, width, height);
    
    if (botaoVoltarUM) {
      desenhar_botaoVoltarUM();
    }
  }
}
    
void rionunes() {
  
  //tela 23
  if (tela == 23) {
    background(255);
    image(telarionunes, 0, 0, width, height);
    
    if (botaoVoltarUM) {
      desenhar_botaoVoltarUM();
    }
  }
}

void rioparana () {

  //tela 24
  if (tela == 24) {
    background(255);
    image(telarioparana, 0, 0, width, height);
    
    if (botaoVoltarUM) {
      desenhar_botaoVoltarUM();
    }
  }
}

void riopiquiri () {

  //tela 25
  if (tela == 25) {
    background(255);
    image(telariopiquiri, 0, 0, width, height);
    
    if (botaoVoltarUM) {
      desenhar_botaoVoltarUM();
  }
  }
}  

void riotibagi () {

  //tela 26
  if (tela == 26) {
    background(255);
    image(telariotibagi, 0, 0, width, height);
    
    if (botaoVoltarUM) {
      desenhar_botaoVoltarUM();
    }
  }
}

void riotubatao () {

  //tela 27
  if (tela == 27) {
    background(255);
    image(telariotubatao, 0, 0, width, height);
    
    if (botaoVoltarUM) {
      desenhar_botaoVoltarUM();
    }
  }
}

void riomarumbi() {

  //tela 27
  if (tela == 28) {
    background(255);
    image(telariomarumbi, 0, 0, width, height);
    
    if (botaoVoltarUM) {
      desenhar_botaoVoltarUM();
    }
  }
}


void draw() {
  
  tela_zero();
  tela_um();
  tela_dois();
  tela_tres();
  
  RiosDoInterior();
  BaciaFozIguacu();
  BaciasDoLitoral();
  BaciasDoAltoRioParana();
    
  BLcaract();
  BLbio();
  BLimpor();

  BARPcaract();
  BARPbio();
  BARPimpor();

  BRLcaract();
  BRLbio();
  BRLimpor();

  RIcaract();
  RIbio();
  RIimpor();
  
  rioiguacu();
  rioivai();
  rionhundiaquara();
  rionunes();
  rioparana();
  riopiquiri();
  riotibagi();
  riotubatao();
  riomarumbi();
  
}  
  


//aqui é a contrução do "corpo" do menu
void desenharMenu() {
  cam.beginHUD();
  // fundo escuro transparente
  fill(0, 0, 0, 120);
  rect(0, 0, width, height);

  // caixa do menu lateral
  fill(255);
  rect(0, 0, 300, height);

  // título
  fill(0);
  textSize(40);
  text("Mergulhando", 20, 100);
  textSize(20);
  text("Nas Bacias do Paraná", 20, 130);
  
  //botao menu > tela 1
  image(BaciasBotao,30,200);
  
  //botao menu > tela 2
  image(RiosBotao,30,300);
  
   //botao menu > tela 3
  image(Relevo3DBotao,30,400);
  
  // botão fechar (X)
  fill(100);
  circle(276,58,45);
  fill(255);
  textSize(35);
  text(">", 269, 70);
  cam.endHUD();
}

//esse é botão que abre o menu
void desenhar_botaoMenu() {
  cam.beginHUD();
  pushMatrix();
  noStroke();
  fill(100);
  circle(47, 55, 45);

  fill(255);
  textSize(30);
  textAlign(LEFT, BASELINE);
  text("=", 40, 65);
  popMatrix();
  cam.endHUD();
  
}

//botao Voltar do menu
void desenhar_botaoVoltar() {
  pushMatrix();
  noStroke();
  fill(20,150,70);
  rect(1200,30,50,50);
  fill(0);
  textSize(25);
  text("<",1215,65);
  popMatrix();
}

//botao voltar tela um
void desenhar_botaoVoltarUM() {
  pushMatrix();
  noStroke();
  fill(20,150,70);
  rect(1200,30,50,50);
  fill(0);
  textSize(25);
  text("<",1215,65);
  popMatrix();
}

//botao Voltar das telas do RI
void desenhar_botaoVoltarBL() {
  println("função chamada Bl!");
  pushMatrix();
  noStroke();
  fill(0,255,0);
  rect(1200,15,50,50);  
  fill(0);
  popMatrix();
}

//botao Voltar das telas do RI
void desenhar_botaoVoltarBRL() {
  println("função chamada Brl!");
  pushMatrix();
  noStroke();
  fill(0,255,0);
  rect(1200,15,50,50);  
  fill(0);
  popMatrix();
}

//botao Voltar das telas do RI
void desenhar_botaoVoltarBARP() {
  println("função chamada BARP!");
  pushMatrix();
  noStroke();
  fill(0,255,0);
  rect(1200,15,50,50);  
  fill(0);
  popMatrix();
}

//botao Voltar das telas do RI
void desenhar_botaoVoltarRI() {
  println("função chamada ri!");
  pushMatrix();
  noStroke();
  fill(0,255,0);
  rect(1200,15,50,50);  
  fill(0);
  popMatrix();
}

void desenharContorno(float[] x, float[] y) {
  pushMatrix();
  noFill();
  stroke(0);
  strokeWeight(6);

  beginShape();
  for (int i = 0; i < x.length; i++) 
    vertex(x[i], y[i]);
  endShape(CLOSE);
   popMatrix();
}
  
void keyPressed(){
  if (tela == 3){
     if (keyCode == CONTROL){
     cam.setRollRotationMode();    
  }
    if(keyCode == SHIFT){
     cam.setWheelScale(0);
     EscalaAtivada = true;
    }
  }
}

void mouseWheel(MouseEvent event){
 
  if(tela == 3 && EscalaAtivada){
    
    float e = event.getCount();
    
    ZEscala -= e;
    ZEscala = constrain(ZEscala,1,10);
    println(ZEscala);
  }
  
}
  
void keyReleased(){
    if (tela == 3){
     if (keyCode == CONTROL){
     cam.setSuppressRollRotationMode();    
  }
    if(keyCode == SHIFT){
     cam.setWheelScale(1);
     EscalaAtivada = false;
    }
  }
}


void mousePressed() {
  
    // botão abrir menu
    if (mouseX >= 30 && mouseX <= 80 &&
        mouseY >= 30 && mouseY <= 80) {
      menuAberto = !menuAberto;

    }
  
    // botão fechar (X)
    if (menuAberto) {
      if (mouseX >= 250 && mouseX <= 300 &&
          mouseY >= 40 && mouseY <= 90) {
        menuAberto = false;
      }
    }
        
    // botao > tela 1
    if (menuAberto) {
      if (mouseX >= 30 && mouseX <= 270 &&
          mouseY >= 200 && mouseY <= 250) {
          tela = 0;  
          cam.lookAt(width/2, height/2, -50,0);
          cam.setRotations(0,0,0);
          cam.setDistance(674,0);
          cam.setActive(false);
      }
    }
    
    //botao > tela 2
    if (menuAberto) {
      if (mouseX >= 30 && mouseX <= 270 &&
          mouseY >= 300 && mouseY <= 350) {
          tela = 1;
          cam.lookAt(width/2, height/2,-50,0);
          cam.setRotations(0,0,0);
          cam.setDistance(674,0);
          cam.setActive(false);
      }
    }
    
    //botao > tela 3
    if (menuAberto) {
      if(mouseX >= 30 && mouseX <= 270 &&
         mouseY >= 400 && mouseY <= 450) {
         tela = 3;
      
           cam.setActive(true);
           cam.lookAt(width, height, 0,0);
           cam.setSuppressRollRotationMode();
       }
    }
    if (botaoVoltar) {
      if(mouseX >= 1200 && mouseX <= 1250 &&
         mouseY >= 30 && mouseY <= 80) {
         tela = 0;
         botaoVoltar = false;
         menuAberto = false;
       }
    }
    if (botaoVoltarUM) {
        if(mouseX >= 1200 && mouseX <= 1250 &&
         mouseY >= 30 && mouseY <= 80) {
         tela = 1;
         botaoVoltarUM = false;
         menuAberto = false;
    }
    }   
      // voltar telas BL
  if (botaoVoltarBL) {
    if (mouseX >= 1200 && mouseX <= 1250 &&
        mouseY >= 15 && mouseY <= 65) {
  
      tela = 6;
      botaoVoltarBL = false;
      botaoVoltar = true;
    }
  }
  
  // voltar telas BRL
  if (botaoVoltarBRL) {
    if (mouseX >= 1200 && mouseX <= 1250 &&
        mouseY >= 15 && mouseY <= 65) {
  
      tela = 5;
      botaoVoltarBRL = false;
      botaoVoltar = true;
    }
  }
  
  // voltar telas BARP
  if (botaoVoltarBARP) {
    if (mouseX >= 1200 && mouseX <= 1250 &&
        mouseY >= 15 && mouseY <= 65) {
  
      tela = 7;
      botaoVoltarBARP = false;
      botaoVoltar = true;
    }
  }
  
  // voltar telas RI
  if (botaoVoltarRI) {
    if (mouseX >= 1200 && mouseX <= 1250 &&
        mouseY >= 15 && mouseY <= 65) {
  
      tela = 4;
      botaoVoltarRI = false;
      botaoVoltar = true;
    }
  }

    if (tela == 0 && !menuAberto) {
      
        // RI -> tela 4
        if (pontoDentroPoligono(mouseX, mouseY, xRegiaoRI, yRegiaoRI)) {
          tela = 4;
          botaoVoltar = true;
        }
      
        // BRL -> tela 5
        if (pontoDentroPoligono(mouseX, mouseY, xRegiaoBRL, yRegiaoBRL)) {
          tela = 5;
          botaoVoltar = true;
        }
      
        // BL -> tela 6
        if (pontoDentroPoligono(mouseX, mouseY, xRegiaoBL, yRegiaoBL)) {
          tela = 6;
          botaoVoltar = true;
        }
      
        // BARP -> tela 7
        if (pontoDentroPoligono(mouseX, mouseY, xRegiaoBARP, yRegiaoBARP)) {
          tela = 7;
          botaoVoltar = true;
        }
      }
      
  if (tela == 1 && !menuAberto) {
    if (pontoDentroPoligono(mouseX, mouseY, xrioiguacu, yrioiguacu)) {
      tela = 20;
      botaoVoltarUM = true;
    }
  
    if (pontoDentroPoligono(mouseX, mouseY, xrioivai, yrioivai)) {
      tela = 21;
      botaoVoltarUM = true;
    }
  
    if (pontoDentroPoligono(mouseX, mouseY, xriomarumbi, yriomarumbi)) {
      tela = 28;
      botaoVoltarUM = true;
    }
  
    if (pontoDentroPoligono(mouseX, mouseY, xrionhundiaria, yrionhundiaria)) {
      tela = 22;
      botaoVoltarUM = true;
    }
  
    if (pontoDentroPoligono(mouseX, mouseY, xrionunes, yrionunes)) {
      tela = 23;
      botaoVoltarUM = true;
    }
    
    if (pontoDentroPoligono(mouseX, mouseY, xrioparnaa, yrioparnaa) && frameCount % 3 == 0) {
      tela = 24;
      botaoVoltarUM = true;
    }
  
    if (pontoDentroPoligono(mouseX, mouseY, xriopiraqui, yriopiraqui)) {
      tela = 25;
      botaoVoltarUM = true;
    }
  
    if (pontoDentroPoligono(mouseX, mouseY, xriotibagi, yriotibagi)) {
      tela = 26;
      botaoVoltarUM = true;
    }
    
    if (pontoDentroPoligono(mouseX, mouseY, xriocubatao, yriocubatao)) {
      tela = 27;
      botaoVoltarUM = true;
    }
}
  
     
    //RI
    if (tela == 4) {
      
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 97 && mouseY <= 217) {
          tela = 17;
          botaoVoltar = false;    
          botaoVoltarRI = true;       
          }
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 300 && mouseY <= 420) {
          tela = 19;
          botaoVoltar = false;
          botaoVoltarRI = true;       
          }
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 470 && mouseY <= 590) {
          tela = 18;
          botaoVoltar = false;
          botaoVoltarRI = true;       
          }   
        }
        
    //BRL
    if (tela == 5) {
      
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 115 && mouseY <= 235) {
          tela = 14;
          botaoVoltar = false;
          botaoVoltarBRL = true;     
          }
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 315 && mouseY <= 435) {
          tela = 15;
          botaoVoltar = false;
          botaoVoltarBRL = true;     
          }
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 470 && mouseY <= 590) {
          tela = 16;
          botaoVoltar = false;
          botaoVoltarBRL = true;     
          }   
        }
   
    //BL
    if (tela == 6) {
      
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 100 && mouseY <= 220) {
          tela = 8;
          botaoVoltar = false;
          botaoVoltarBL = true;     
          }
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 315 && mouseY <= 435) {
          tela = 10;
          botaoVoltar = false;
          botaoVoltarBL = true;     
          }
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 470 && mouseY <= 590) {
          tela = 9;
          botaoVoltar = false;
          botaoVoltarBL = true;     
          }   
        }
      
    //BARP
    if (tela == 7) {
      
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 110 && mouseY <= 230) {
          tela = 11;
          botaoVoltar = false;
          botaoVoltarBARP = true;     
          }
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 315 && mouseY <= 435) {
          tela = 12;
          botaoVoltar = false;
          botaoVoltarBARP = true;     
          }
      if (mouseX >= 28 && mouseX <= 158 &&
          mouseY >= 470 && mouseY <= 590) {
          tela = 13;
          botaoVoltar = false;
          botaoVoltarBARP = true;     
          }   
        }
       
    }
  

  boolean pontoDentroPoligono(float px, float py, float[] x, float[] y) {
    boolean dentro = false;

    for (int i = 0, j = x.length - 1; i < x.length; j = i++) {
      if ((y[i] > py) != (y[j] > py) &&
        px < (x[j] - x[i]) * (py - y[i]) / (y[j] - y[i]) + x[i]) {
        dentro = !dentro;
      }
    }

    return dentro;
  }
