(*:Version: Mathematica 2.0 *)

(*:Name: NumberTheory`Collatz` *)


(*:Title: The Collatz problem, Also Known as The 3x+1 Problem *)


(*:Author: Ilan Vardi

*)

(*:Keywords: Collatz problem, 3x+1 problem
*)

(*:Requirements: none. *)

(*:Warnings: The Collatz map is taken to be x -> x/2 if x is even and
             x -> (3x+1)/2 if x is odd. This simplifies the analysis
             of the problem. The previous package Collatz.m used the
             map x -> 3x+1 if x is odd. 
           
             A table is computed when the package is loaded in, so it 
             could take as long as 5 minutes to read in the package.

             $RecursionLimit is set to Infinity, since there is a high
             degree of recursion in the algorithm.

*)

(*:Source: J.C. Lagarias, The 3x+1 problem and its generalizations,
           American Math. Monthly #92 (1985), 3-23 

           I. Vardi, Computational Recreactions in Mathematica,
           Addison-Wesley 1991, Chapter 7

*)

(*:Limitations: The program terminates only if an iterate reaches one of
           the 4 known cycles. If the input reaches another cycle, then
           the algorithm will not terminate.

           TotalStoppingTime seems to work up to 30,000 digit numbers
           but runs out of memory after that.
             
*)

(* :Discussion: This package computes the iterates of the Collatz map 
            x -> x/2 if x is even, x -> (3x+1)/2 if x is odd, until an
            iterate reaches one of the 4 known cycles (the program runs
            on positive and negative integers):
 
            {1,2}, {-1}, {-5, -7, -10}, 
            {-17, -25, -37, -55, -82, -41, -61, -91, -136, -68, -34}

            An efficient algorithm is used to compute how many iterations
            there are up to a cycle (the total stopping time). This
            algorithm is discussed in detail in Computational Recreations 
            in Mathematica, Chapter 7. 
            
*)


BeginPackage["Examples`Collatz`"] 

Collatz::usage = "Collatz[n] returns the iterates of the Collatz map up
to one of the known cycles."

TotalStoppingTime::usage = "TotalStoppingTime[n] gives the number of iterates
of the Collatz map up to one of the known cycles. It gives the same result as
Length[Collatz[n]]-1 but is much more efficient. TotalStoppingTime[n]  
returning an answer gives a check of the 3x+1 conjecture for n."

Begin["`Private`"]  

(* V1.2   FoldList[f_, x_, list_]:= Accumulate[f, Prepend[list, x]] *)

CollatzT[n_]:= If[EvenQ[n], n/2, (3 n + 1)/2]

Collatz[1]:= {1} 

Collatz[-1]:= {-1} 

Collatz[-5]:= {-5}

Collatz[-17]:= {-17}

Collatz[n_Integer]:= Prepend[Collatz[CollatzT[n]], n] /; 
                     Abs[n] < 2050


Collatz[n_Integer]:= 
 Block[{cr}, 
        cr = Flatten[NestList[CollatzT, #, 9]& /@
                     CollatzIterate[n]]; 
       Join[cr, Rest[Collatz[Last[cr]]]]]

TotalStoppingTime[n_Integer]:= 
  Length[Collatz[n]] - 1     /; Abs[n] < 2055

TotalStoppingTime[n_Integer] := 
  10 + TotalStoppingTime[{n, 1} . 
  CollatzTable10[[1 + Mod[n, 1024]]]] /;
            2055 <= Abs[n] <= 2^1002

TotalStoppingTime[n_Integer]:= 
 1000 + 
 TotalStoppingTime[
 NestList[Block[
        {a = CollatzTable10[[1+Mod[#[[2]], 1024]]]},
        {SemiProduct[#[[1]], a], Mod[{#[[2]], 1} . a, 
                 2^1000]}]&,
           {{1, 0}, Mod[n, 2^1000]},
            100] [[-1, 1]] . {n, 1}]      /; 
                        Abs[n] > 2^1002

SemiProduct[{a_, b_}, {c_, d_}]:= {a c, b c + d}


CollatzIterate[n_Integer]:= {}     /; Abs[n] < 2055

CollatzIterate[n_Integer]:= 
  Prepend[CollatzIterate[{n, 1} . 
          CollatzTable10[[1 + Mod[n, 1024]]]], n] 


CollatzTable[k_Integer]:= 
  RotateRight[
      Map[Function[x,  
         {3^Apply[Plus, x] / 2^Length[x], 
             Reverse[x] . 
             FoldList[#1 #2 &, 1/2,
                      1/2 3^Reverse[Rest[x]]]}],
             Mod[Map[NestList[CollatzT,
                         #, k-1] &,
             Range[1, 2^k]], 2]]]

CollatzTable10 = CollatzTable[10] 

$RecursionLimit = Infinity;

End[]   (* Examples`Collatz`Private` *)

Protect[Collatz, TotalStoppingTime]

EndPackage[]   (* Examples`Collatz` *)    
