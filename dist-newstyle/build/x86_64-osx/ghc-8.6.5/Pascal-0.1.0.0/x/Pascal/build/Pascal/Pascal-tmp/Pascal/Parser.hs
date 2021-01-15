{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap4 = HappyWrap4 (FullProgram)
happyIn4 :: (FullProgram) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap4 x)
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> HappyWrap4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
newtype HappyWrap5 = HappyWrap5 ([Definition])
happyIn5 :: ([Definition]) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap5 x)
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> HappyWrap5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
newtype HappyWrap6 = HappyWrap6 (Definition)
happyIn6 :: (Definition) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap6 x)
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> HappyWrap6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
newtype HappyWrap7 = HappyWrap7 (VType)
happyIn7 :: (VType) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap7 x)
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> HappyWrap7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
newtype HappyWrap8 = HappyWrap8 ([([String], VType)])
happyIn8 :: ([([String], VType)]) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap8 x)
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> HappyWrap8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
newtype HappyWrap9 = HappyWrap9 (([String], VType))
happyIn9 :: (([String], VType)) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap9 x)
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> HappyWrap9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
newtype HappyWrap10 = HappyWrap10 ([(String, VType)])
happyIn10 :: ([(String, VType)]) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap10 x)
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> HappyWrap10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
newtype HappyWrap11 = HappyWrap11 ((String, VType))
happyIn11 :: ((String, VType)) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap11 x)
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> HappyWrap11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
newtype HappyWrap12 = HappyWrap12 ([String])
happyIn12 :: ([String]) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap12 x)
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> HappyWrap12
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
newtype HappyWrap13 = HappyWrap13 (BoolExp)
happyIn13 :: (BoolExp) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap13 x)
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> HappyWrap13
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
newtype HappyWrap14 = HappyWrap14 (Exp)
happyIn14 :: (Exp) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap14 x)
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> HappyWrap14
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
newtype HappyWrap15 = HappyWrap15 (Exp)
happyIn15 :: (Exp) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap15 x)
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> HappyWrap15
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
newtype HappyWrap16 = HappyWrap16 (Exp)
happyIn16 :: (Exp) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap16 x)
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> HappyWrap16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
newtype HappyWrap17 = HappyWrap17 (BoolExp)
happyIn17 :: (BoolExp) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap17 x)
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> HappyWrap17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
newtype HappyWrap18 = HappyWrap18 ([String])
happyIn18 :: ([String]) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap18 x)
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> HappyWrap18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
newtype HappyWrap19 = HappyWrap19 (String)
happyIn19 :: (String) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 ([Statement])
happyIn20 :: ([Statement]) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 (Statement)
happyIn21 :: (Statement) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap21 x)
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> HappyWrap21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x01\x00\xc0\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\xc0\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x0e\xa0\x00\xf1\x9f\x03\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7c\x1f\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0c\x00\x00\x08\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\xee\x00\x0a\x10\xff\x39\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x02\x00\x00\x00\x00\x00\x00\x60\x0e\x20\x00\x00\x00\x00\x00\x00\x00\xe6\x00\x02\x00\x00\x00\x00\x00\x00\xe0\x0e\x20\x00\xf1\x01\x00\x03\x00\x00\xee\x00\x0a\x10\xff\x39\x70\x00\x00\xe0\x0e\x20\x00\xf1\x01\x00\x03\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0e\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\xee\x00\x02\x10\x1f\x00\x30\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\xee\x00\x02\x10\x1f\x00\x30\x00\x00\xe0\x0e\x20\x00\xf1\x01\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xee\x00\x02\x10\x1f\x00\x30\x00\x00\x60\x0e\x20\x00\xf0\x01\x00\x00\x00\x00\xe6\x00\x02\x00\x1f\x00\x00\x00\x00\x60\x0e\x20\x00\xf0\x01\x00\x00\x00\x00\xe6\x00\x02\x00\x1f\x00\x00\x00\x00\x60\x0e\x20\x00\xf0\x01\x00\x00\x00\x00\xc0\xf7\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\xc0\xf7\x05\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x0c\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x60\x0e\x20\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\xe0\x0e\x20\x00\xf1\x01\x00\x03\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x0e\x20\x00\xf1\x01\x00\x03\x00\x00\xee\x00\x02\x10\x1f\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe6\x00\x02\x00\x00\x00\x00\x00\x00\x60\x0e\x20\x00\x00\x00\x00\x00\x00\x00\xe6\x00\x02\x00\x00\x00\x00\x00\x00\x60\x0e\x20\x00\x00\x00\x00\x00\x00\x00\xe6\x00\x02\x00\x1f\x00\x00\x00\x00\x60\x0e\x20\x00\xf0\x01\x00\x00\x00\x00\xe6\x00\x02\x00\x1f\x00\x00\x00\x00\x60\x0e\x20\x00\xf0\x01\x00\x00\x00\x00\xe6\x00\x02\x00\x1f\x00\x00\x00\x00\x60\x0e\x20\x00\xf0\x01\x00\x00\x00\x00\xe6\x00\x02\x00\x1f\x00\x00\x00\x00\x60\x0e\x20\x00\xf0\x01\x00\x00\x00\x00\xe6\x00\x02\x00\x1f\x00\x00\x00\x00\x60\x0e\x20\x00\xf0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x00\x00\x00\x00\x00\x00\x00\x00\xe6\x00\x02\x00\x1f\x00\x00\x00\x00\x00\x3c\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\xf7\x01\x00\x00\x00\x08\x00\x00\x00\x00\x00\xc0\x00\x00\x80\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x3c\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\xc0\x03\x04\x00\x00\x00\x00\x00\x00\x00\x3c\x40\x00\x00\x00\x00\x00\x00\x00\xc0\x03\x04\x00\x00\x00\x00\x00\x00\x00\x3c\x40\x00\x00\x00\x00\x00\x00\x00\xc0\x03\x04\x00\x00\x00\x00\x00\x00\x00\x7c\x5f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x0c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x0c\x00\x00\x00\x00\x00\x00\x00\x40\xc0\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\xe0\x0e\x20\x00\xf1\x01\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\xe0\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x10\x00\x00\x0c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x0c\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\xc0\x03\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x0e\xa0\x00\xf1\x9f\x03\x07\x00\x00\xee\x00\x0a\x10\xff\x39\x70\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\xee\x00\x0a\x10\xff\x39\x70\x00\x00\x00\x00\x00\x10\x00\x00\x0c\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xee\x00\x0a\x10\xff\x39\x70\x00\x00\xe0\x0e\xa0\x00\xf1\x9f\x03\x07\x00\x00\xee\x00\x0a\x10\xff\x39\x70\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\xee\x00\x0a\x10\xff\x39\x70\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\xee\x00\x0a\x10\xff\x39\x70\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParser","Program","Defs","Definition","Type","Functions","List","VarList","VarIndividual","ID_list","CompExp","FloatExp","MathExp","Exp","BoolExp","MultipleLines","OneLine","Statements","Statement","int","real","bool","string","ID","'+'","'-'","'*'","'/'","'='","':='","'<>'","'>'","'<'","'>='","'<='","'('","')'","'begin'","'end.'","'boolean'","'real'","'string'","'var'","'end'","'and'","'or'","'not'","','","':'","'program'","'sin'","'cos'","'sqrt'","'exp'","'ln'","'writeln'","'break'","'continue'","'if'","'then'","'else'","'while'","'for'","'case'","'function'","'procedure'","'of'","'to'","'do'","';'","'true'","'false'","'readln'","%eof"]
        bit_start = st * 76
        bit_end = (st + 1) * 76
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..75]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xe2\xff\xe2\xff\x0e\x00\xe3\xff\xf8\xff\xed\xff\x1d\x00\xed\xff\x3f\x00\x4b\x00\x4d\x00\x23\x00\x45\x00\x36\x00\x22\x00\x00\x00\x01\x00\x00\x00\xa5\x00\x00\x00\x9c\x00\xfe\xff\x52\x00\x01\x00\x00\x00\x00\x00\x00\x00\xb6\x00\xcd\x00\xcd\x00\x37\x00\x01\x00\x37\x00\x4e\x00\x5f\x00\x68\x00\x71\x00\x74\x00\x81\x00\x56\x00\x6b\x00\x9f\x00\xb1\x00\xc3\x00\xde\x00\x00\x00\x00\x00\xeb\x00\xd1\x00\x09\x00\x09\x00\xd1\x00\xd1\x00\xe3\x00\xcf\x00\xf5\x00\x37\x01\x43\x01\xec\x00\x00\x00\x00\x00\x00\x00\xe0\x01\x00\x00\xe6\x01\x37\x00\xe2\x01\x37\x00\x37\x00\x00\x00\x00\x00\x40\x00\xc4\x00\xc4\x00\xc4\x00\xc4\x00\xc4\x00\x1a\x01\x2f\x00\x18\x00\xd5\x01\xe4\x00\x03\x00\x43\x00\x0e\x01\x00\x00\xcd\x00\x0e\x01\x6c\x00\xc8\x00\x00\x00\x00\x00\x75\x00\x75\x00\x00\x00\xcd\x00\xcd\x00\xcd\x00\xcd\x00\xc4\x00\xc4\x00\xc4\x00\xc4\x00\xc4\x00\xc4\x00\xc4\x00\xc4\x00\xc4\x00\xc4\x00\x00\x00\xd4\x00\xc4\x00\xd4\x00\xd4\x00\xd4\x00\xd4\x00\xd4\x00\x00\x00\x00\x00\x15\x01\x15\x01\x00\x00\x00\x00\x28\x01\x28\x01\x1f\x01\x1f\x01\xda\x01\xd2\x01\x00\x00\x00\x00\xb0\x00\x32\x00\xfc\xff\x03\x00\x00\x00\x00\x00\x00\x00\xbd\x01\x78\x00\x94\x00\xfe\x00\x02\x01\x06\x01\xf1\x00\x79\x00\x8d\x00\xa9\x00\xc5\x00\xf0\x01\xc7\x00\xe3\x01\x75\x00\x00\x00\xd4\x01\x09\x00\xee\x01\xc3\x01\xed\xff\x00\x00\x00\x00\x09\x00\x08\x00\x34\x00\xc5\x01\xc9\x01\xc6\x01\xc2\x01\xd1\x01\xc8\x01\xcb\x01\xcc\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x01\x00\x00\x00\x00\x3e\x01\xce\x01\x13\x01\x00\x00\x00\x00\xea\x01\x00\x00\x00\x00\x00\x00\x01\x00\x01\x00\xfc\x01\xfd\x01\x00\x00\x00\x00\x00\x00\xcf\x01\xf1\x01\x01\x00\xed\xff\xe5\x01\xd7\x01\x00\x00\xdb\x01\xd9\x01\x00\x00\x01\x00\x01\x00\x01\x00\xf3\x01\xef\x01\xdc\x01\x01\x00\x04\x02\x00\x00\x00\x00\xec\x01\xf2\x01\x00\x00\xdd\x01\x01\x00\xf4\x01\x00\x00\xde\x01\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x0e\x02\x00\x00\x00\x00\x00\x00\x00\x00\x4a\x01\x00\x00\xdf\x01\x0a\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x22\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2b\x01\x00\x00\x00\x00\x00\x00\x00\x00\x07\x02\x08\x02\x85\x01\x34\x01\x8a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0d\x02\x13\x02\x14\x02\x7f\x00\x0d\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8f\x01\x00\x00\x94\x01\x99\x01\x00\x00\x00\x00\x9e\x01\x5e\x00\x53\x01\x5c\x01\x65\x01\x6e\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0c\x02\x00\x00\xa3\x01\xb4\x01\x00\x00\x00\x00\xa8\x01\xad\x01\x00\x00\x0f\x02\x10\x02\x11\x02\x12\x02\x77\x01\x80\x01\xbb\x01\xbe\x01\xc1\x01\xc4\x01\xc7\x01\xca\x01\xcd\x01\xd0\x01\x00\x00\x00\x00\xd3\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb2\x01\x00\x00\x00\x00\x16\x02\xbc\x01\x00\x00\xe1\x01\x00\x00\x00\x00\x17\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd6\x01\x00\x00\x00\x00\xd8\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4f\x01\x58\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3d\x01\xe7\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x61\x01\x6a\x01\x73\x01\x00\x00\x00\x00\x00\x00\x46\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7c\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfd\xff\x00\x00\xfd\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfc\xff\xc2\xff\xcb\xff\x00\x00\xe4\xff\xe5\xff\x00\x00\x00\x00\xc2\xff\xd0\xff\xd1\xff\xc8\xff\xd2\xff\x00\x00\x00\x00\x00\x00\xc2\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xcf\xff\xce\xff\x00\x00\x00\x00\x00\x00\x00\x00\xf3\xff\xf3\xff\x00\x00\x00\x00\x00\x00\xed\xff\x00\x00\x00\x00\xf6\xff\xf5\xff\xf4\xff\x00\x00\xec\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb6\xff\xb5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xcc\xff\xd2\xff\x00\x00\x00\x00\xe5\xff\x00\x00\xd3\xff\xd2\xff\x00\x00\xd4\xff\x00\x00\x00\x00\xc1\xff\xfe\xff\x00\x00\x00\x00\xc0\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbf\xff\xe7\xff\x00\x00\xe6\xff\xe9\xff\xe8\xff\xea\xff\xeb\xff\xe1\xff\xe2\xff\xe0\xff\xe3\xff\xd7\xff\xd8\xff\xd6\xff\xd9\xff\xc9\xff\xca\xff\x00\x00\xc6\xff\xc3\xff\xc4\xff\x00\x00\x00\x00\xd2\xff\x00\x00\xcd\xff\xd5\xff\xdf\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd2\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfb\xff\x00\x00\x00\x00\xf3\xff\x00\x00\xfd\xff\xf2\xff\xf1\xff\x00\x00\xe5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xda\xff\xdb\xff\xdc\xff\xdd\xff\xde\xff\xb4\xff\x00\x00\xbd\xff\xbe\xff\x00\x00\x00\x00\x00\x00\xb8\xff\xc5\xff\x00\x00\xbb\xff\xba\xff\xbc\xff\x00\x00\x00\x00\x00\x00\x00\x00\xb9\xff\xf9\xff\xfa\xff\x00\x00\x00\x00\xc2\xff\xfd\xff\x00\x00\x00\x00\xb2\xff\x00\x00\x00\x00\xb7\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc2\xff\x00\x00\xb1\xff\xb3\xff\x00\x00\x00\x00\xf7\xff\x00\x00\x00\x00\x00\x00\xf8\xff\x00\x00\xb0\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x1f\x00\x01\x00\x02\x00\x03\x00\x18\x00\x05\x00\x06\x00\x07\x00\x06\x00\x07\x00\x08\x00\x09\x00\x11\x00\x06\x00\x07\x00\x08\x00\x09\x00\x11\x00\x05\x00\x13\x00\x12\x00\x1a\x00\x1b\x00\x1a\x00\x1b\x00\x37\x00\x2e\x00\x2f\x00\x1c\x00\x15\x00\x16\x00\x17\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x12\x00\x33\x00\x2b\x00\x2c\x00\x2d\x00\x33\x00\x13\x00\x33\x00\x1a\x00\x1b\x00\x11\x00\x34\x00\x35\x00\x36\x00\x01\x00\x02\x00\x03\x00\x33\x00\x05\x00\x06\x00\x07\x00\x1d\x00\x1e\x00\x01\x00\x02\x00\x03\x00\x05\x00\x05\x00\x06\x00\x07\x00\x11\x00\x1a\x00\x1b\x00\x33\x00\x1a\x00\x1b\x00\x1a\x00\x1b\x00\x05\x00\x11\x00\x05\x00\x1c\x00\x1e\x00\x12\x00\x11\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x1c\x00\x1a\x00\x1b\x00\x11\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x33\x00\x14\x00\x33\x00\x0a\x00\x0b\x00\x0c\x00\x34\x00\x35\x00\x01\x00\x02\x00\x03\x00\x11\x00\x05\x00\x06\x00\x07\x00\x34\x00\x35\x00\x01\x00\x02\x00\x03\x00\x11\x00\x05\x00\x06\x00\x07\x00\x11\x00\x06\x00\x07\x00\x08\x00\x09\x00\x11\x00\x04\x00\x05\x00\x11\x00\x11\x00\x08\x00\x1c\x00\x33\x00\x12\x00\x12\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x1c\x00\x11\x00\x1a\x00\x1b\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x06\x00\x07\x00\x08\x00\x09\x00\x33\x00\x12\x00\x34\x00\x35\x00\x06\x00\x07\x00\x08\x00\x09\x00\x12\x00\x1a\x00\x1b\x00\x34\x00\x35\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x11\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x12\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x0b\x00\x11\x00\x1a\x00\x1b\x00\x01\x00\x02\x00\x11\x00\x05\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x01\x00\x02\x00\x1a\x00\x1b\x00\x05\x00\x06\x00\x07\x00\x11\x00\x05\x00\x12\x00\x33\x00\x12\x00\x06\x00\x07\x00\x08\x00\x09\x00\x11\x00\x1a\x00\x1b\x00\x1a\x00\x1b\x00\x33\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x33\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x11\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x12\x00\x12\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x11\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x33\x00\x12\x00\x06\x00\x07\x00\x08\x00\x09\x00\x06\x00\x07\x00\x08\x00\x09\x00\x06\x00\x07\x00\x08\x00\x09\x00\x12\x00\x04\x00\x05\x00\x1e\x00\x12\x00\x08\x00\x08\x00\x09\x00\x12\x00\x06\x00\x07\x00\x08\x00\x09\x00\x08\x00\x09\x00\x33\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x12\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x08\x00\x09\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x1a\x00\x1b\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x04\x00\x05\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x01\x00\x02\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x1d\x00\x12\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x04\x00\x05\x00\x0e\x00\x0f\x00\x08\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x01\x00\x02\x00\x01\x00\x02\x00\x0e\x00\x0f\x00\x0e\x00\x0f\x00\x01\x00\x02\x00\x0a\x00\x05\x00\x12\x00\x0b\x00\x19\x00\x1d\x00\x33\x00\x01\x00\x1e\x00\x05\x00\x32\x00\x12\x00\x33\x00\x31\x00\x33\x00\x30\x00\x29\x00\x33\x00\x12\x00\x01\x00\x33\x00\x33\x00\x03\x00\x33\x00\x33\x00\x1e\x00\x13\x00\x2a\x00\x13\x00\x03\x00\x19\x00\x32\x00\x1e\x00\x19\x00\x33\x00\x19\x00\x00\x00\x33\x00\x33\x00\x33\x00\x08\x00\x0c\x00\x0c\x00\x08\x00\x03\x00\x03\x00\x0c\x00\x03\x00\x03\x00\x0c\x00\x0c\x00\x0c\x00\x0c\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x03\x00\x19\x00\x1a\x00\x1b\x00\x09\x00\x1c\x00\x1d\x00\x1e\x00\x60\x00\x61\x00\x62\x00\x63\x00\xb3\x00\x60\x00\x61\x00\x62\x00\x63\x00\x1f\x00\x05\x00\x20\x00\x89\x00\xc7\xff\xc7\xff\x5d\x00\x5e\x00\xff\xff\x0a\x00\x0b\x00\x21\x00\x3c\x00\x3d\x00\x3e\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\xc7\xff\x06\x00\x2b\x00\x2c\x00\x2d\x00\xc7\xff\x11\x00\x5f\x00\xc7\xff\xc7\xff\x35\x00\x2e\x00\x2f\x00\x30\x00\x19\x00\x1a\x00\x1b\x00\xc5\x00\x50\x00\x1d\x00\x1e\x00\x31\x00\x32\x00\x19\x00\x1a\x00\x1b\x00\x0f\x00\x93\x00\x1d\x00\x1e\x00\x1f\x00\x5d\x00\x5e\x00\xc7\xff\x5d\x00\x5e\x00\x5d\x00\x5e\x00\x0d\x00\x1f\x00\x0c\x00\x21\x00\x33\x00\x88\x00\x34\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x21\x00\x5d\x00\x5e\x00\x4d\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\xb4\x00\x5c\x00\xc4\x00\x8f\x00\x13\x00\x14\x00\x2e\x00\x2f\x00\x19\x00\x1a\x00\x1b\x00\x4c\x00\x86\x00\x1d\x00\x1e\x00\x2e\x00\x2f\x00\x19\x00\x1a\x00\x1b\x00\x4b\x00\x50\x00\x1d\x00\x1e\x00\x1f\x00\x64\x00\x65\x00\x66\x00\x67\x00\x4a\x00\x39\x00\x36\x00\x49\x00\x1f\x00\x37\x00\x21\x00\x47\x00\xb1\x00\xab\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x21\x00\x48\x00\x5d\x00\x5e\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x64\x00\x65\x00\x66\x00\x67\x00\x46\x00\xaa\x00\x2e\x00\x2f\x00\x60\x00\x61\x00\x62\x00\x63\x00\xb0\x00\xc7\xff\xc7\xff\x2e\x00\x2f\x00\x64\x00\x65\x00\x66\x00\x67\x00\x68\x00\x45\x00\x69\x00\x6a\x00\x6b\x00\x6c\x00\x6d\x00\x64\x00\x65\x00\x66\x00\x67\x00\x68\x00\xa9\x00\x69\x00\x6a\x00\x6b\x00\x6c\x00\x6d\x00\x59\x00\x44\x00\x5d\x00\x5e\x00\x19\x00\x1a\x00\x5a\x00\x43\x00\x56\x00\x1d\x00\x1e\x00\x82\x00\x83\x00\x19\x00\x1a\x00\xc7\xff\xc7\xff\x56\x00\x1d\x00\x1e\x00\x70\x00\x39\x00\xa8\x00\x6e\x00\xa6\x00\x64\x00\x65\x00\x66\x00\x67\x00\x57\x00\x5d\x00\x5e\x00\x5d\x00\x5e\x00\xb5\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\xc7\xff\x64\x00\x65\x00\x66\x00\x67\x00\x68\x00\x42\x00\x69\x00\x6a\x00\x6b\x00\x6c\x00\x6d\x00\x9e\x00\x8a\x00\x64\x00\x65\x00\x66\x00\x67\x00\x68\x00\x41\x00\x69\x00\x6a\x00\x6b\x00\x6c\x00\x6d\x00\x9d\x00\xac\x00\x64\x00\x65\x00\x66\x00\x67\x00\x64\x00\x65\x00\x66\x00\x67\x00\x64\x00\x65\x00\x66\x00\x67\x00\xaf\x00\x35\x00\x36\x00\x9c\x00\xae\x00\x37\x00\x62\x00\x63\x00\xad\x00\x64\x00\x65\x00\x66\x00\x67\x00\x66\x00\x67\x00\x9a\x00\x64\x00\x65\x00\x66\x00\x67\x00\x68\x00\x8a\x00\x69\x00\x6a\x00\x6b\x00\x6c\x00\x6d\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x62\x00\x63\x00\x16\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x5d\x00\x5e\x00\x5a\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x82\x00\x83\x00\x50\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x06\x00\x07\x00\xd3\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x31\x00\x9b\x00\xda\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x8e\x00\x13\x00\x14\x00\xcc\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x8d\x00\x13\x00\x14\x00\xcb\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x8c\x00\x13\x00\x14\x00\xd8\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x8b\x00\x13\x00\x14\x00\xd7\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x78\x00\x13\x00\x14\x00\xd6\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x77\x00\x13\x00\x14\x00\xde\x00\x11\x00\x51\x00\x13\x00\x52\x00\x53\x00\x11\x00\x4d\x00\x13\x00\x14\x00\x4e\x00\x11\x00\x4d\x00\x13\x00\x14\x00\x96\x00\x11\x00\x4d\x00\x13\x00\x14\x00\x94\x00\x11\x00\x4d\x00\x13\x00\x14\x00\x93\x00\x11\x00\x90\x00\x13\x00\x14\x00\x91\x00\x11\x00\x83\x00\x13\x00\x14\x00\x84\x00\x11\x00\x4d\x00\x13\x00\x14\x00\x7e\x00\x11\x00\x4d\x00\x13\x00\x14\x00\x7d\x00\x11\x00\x4d\x00\x13\x00\xa2\x00\xa3\x00\x9f\x00\x36\x00\x7f\x00\x80\x00\x37\x00\x76\x00\x13\x00\x14\x00\x75\x00\x13\x00\x14\x00\x74\x00\x13\x00\x14\x00\x73\x00\x13\x00\x14\x00\x72\x00\x13\x00\x14\x00\x71\x00\x13\x00\x14\x00\x70\x00\x13\x00\x14\x00\x6e\x00\x13\x00\x14\x00\xb7\x00\x13\x00\x52\x00\x0f\x00\x07\x00\xc6\x00\x07\x00\xba\x00\x80\x00\xb9\x00\x80\x00\xd2\x00\x07\x00\x99\x00\x98\x00\xb7\x00\x96\x00\x8b\x00\xb6\x00\xb2\x00\xa7\x00\xa2\x00\x39\x00\xc0\x00\xa5\x00\x9f\x00\xc1\x00\xc3\x00\xc2\x00\xbf\x00\xbe\x00\xce\x00\xcb\x00\xbd\x00\xbc\x00\xca\x00\xb9\x00\xc9\x00\xd2\x00\xc8\x00\xd0\x00\xd6\x00\xda\x00\xd5\x00\xd1\x00\xde\x00\xdd\x00\xcf\x00\xe1\x00\x03\x00\xdc\x00\xe0\x00\xe2\x00\x0d\x00\x57\x00\x54\x00\x3f\x00\x3e\x00\x3a\x00\x86\x00\xa0\x00\xc5\x00\x7c\x00\x7b\x00\x7a\x00\x79\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 79) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79)
	]

happy_n_terms = 56 :: Int
happy_n_nonterms = 18 :: Int

happyReduce_1 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_1 = happyReduce 7# 0# happyReduction_1
happyReduction_1 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut5 happy_x_4 of { (HappyWrap5 happy_var_4) -> 
	case happyOut20 happy_x_6 of { (HappyWrap20 happy_var_6) -> 
	happyIn4
		 ((happy_var_4, happy_var_6)
	) `HappyStk` happyRest}}

happyReduce_2 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_2 = happySpecReduce_0  1# happyReduction_2
happyReduction_2  =  happyIn5
		 ([]
	)

happyReduce_3 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_3 = happySpecReduce_2  1# happyReduction_3
happyReduction_3 happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_1 of { (HappyWrap6 happy_var_1) -> 
	case happyOut5 happy_x_2 of { (HappyWrap5 happy_var_2) -> 
	happyIn5
		 (happy_var_1:happy_var_2
	)}}

happyReduce_4 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_4 = happyReduce 5# 2# happyReduction_4
happyReduction_4 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut12 happy_x_2 of { (HappyWrap12 happy_var_2) -> 
	case happyOut7 happy_x_4 of { (HappyWrap7 happy_var_4) -> 
	happyIn6
		 (VarDef happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_5 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_5 = happyReduce 7# 2# happyReduction_5
happyReduction_5 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut7 happy_x_4 of { (HappyWrap7 happy_var_4) -> 
	case happyOut16 happy_x_6 of { (HappyWrap16 happy_var_6) -> 
	happyIn6
		 (RealVars happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_6 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_6 = happyReduce 7# 2# happyReduction_6
happyReduction_6 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut7 happy_x_4 of { (HappyWrap7 happy_var_4) -> 
	case happyOut17 happy_x_6 of { (HappyWrap17 happy_var_6) -> 
	happyIn6
		 (BoolVars happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_7 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_7 = happyReduce 13# 2# happyReduction_7
happyReduction_7 (happy_x_13 `HappyStk`
	happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut8 happy_x_4 of { (HappyWrap8 happy_var_4) -> 
	case happyOut7 happy_x_7 of { (HappyWrap7 happy_var_7) -> 
	case happyOut5 happy_x_9 of { (HappyWrap5 happy_var_9) -> 
	case happyOut20 happy_x_11 of { (HappyWrap20 happy_var_11) -> 
	happyIn6
		 (FunctionCall happy_var_2 happy_var_4 happy_var_7 (happy_var_9, happy_var_11)
	) `HappyStk` happyRest}}}}}

happyReduce_8 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_8 = happyReduce 11# 2# happyReduction_8
happyReduction_8 (happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut8 happy_x_4 of { (HappyWrap8 happy_var_4) -> 
	case happyOut5 happy_x_7 of { (HappyWrap5 happy_var_7) -> 
	case happyOut20 happy_x_9 of { (HappyWrap20 happy_var_9) -> 
	happyIn6
		 (ProcedureCall happy_var_2 happy_var_4 (happy_var_7, happy_var_9)
	) `HappyStk` happyRest}}}}

happyReduce_9 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_9 = happySpecReduce_1  3# happyReduction_9
happyReduction_9 happy_x_1
	 =  happyIn7
		 (BOOL
	)

happyReduce_10 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_10 = happySpecReduce_1  3# happyReduction_10
happyReduction_10 happy_x_1
	 =  happyIn7
		 (REAL
	)

happyReduce_11 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_11 = happySpecReduce_1  3# happyReduction_11
happyReduction_11 happy_x_1
	 =  happyIn7
		 (STRING
	)

happyReduce_12 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_12 = happySpecReduce_0  4# happyReduction_12
happyReduction_12  =  happyIn8
		 ([]
	)

happyReduce_13 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_13 = happySpecReduce_3  4# happyReduction_13
happyReduction_13 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { (HappyWrap9 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (happy_var_1:happy_var_3
	)}}

happyReduce_14 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_14 = happySpecReduce_3  5# happyReduction_14
happyReduction_14 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { (HappyWrap12 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn9
		 ((happy_var_1, happy_var_3)
	)}}

happyReduce_15 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_15 = happySpecReduce_0  6# happyReduction_15
happyReduction_15  =  happyIn10
		 ([]
	)

happyReduce_16 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_16 = happySpecReduce_3  6# happyReduction_16
happyReduction_16 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { (HappyWrap11 happy_var_1) -> 
	case happyOut10 happy_x_3 of { (HappyWrap10 happy_var_3) -> 
	happyIn10
		 (happy_var_1:happy_var_3
	)}}

happyReduce_17 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_17 = happyReduce 4# 7# happyReduction_17
happyReduction_17 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut7 happy_x_4 of { (HappyWrap7 happy_var_4) -> 
	happyIn11
		 ((happy_var_2, happy_var_4)
	) `HappyStk` happyRest}}

happyReduce_18 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_18 = happySpecReduce_1  8# happyReduction_18
happyReduction_18 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn12
		 ([happy_var_1]
	)}

happyReduce_19 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_19 = happySpecReduce_3  8# happyReduction_19
happyReduction_19 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut12 happy_x_3 of { (HappyWrap12 happy_var_3) -> 
	happyIn12
		 (happy_var_1:happy_var_3
	)}}

happyReduce_20 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_20 = happySpecReduce_3  9# happyReduction_20
happyReduction_20 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp "=" happy_var_1 happy_var_3
	)}}

happyReduce_21 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_21 = happySpecReduce_3  9# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp "<>" happy_var_1 happy_var_3
	)}}

happyReduce_22 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_22 = happySpecReduce_3  9# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp "<" happy_var_1 happy_var_3
	)}}

happyReduce_23 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_23 = happySpecReduce_3  9# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp ">" happy_var_1 happy_var_3
	)}}

happyReduce_24 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_24 = happySpecReduce_3  9# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp "<=" happy_var_1 happy_var_3
	)}}

happyReduce_25 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_25 = happySpecReduce_3  9# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp ">=" happy_var_1 happy_var_3
	)}}

happyReduce_26 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_26 = happySpecReduce_1  10# happyReduction_26
happyReduction_26 happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	happyIn14
		 (happy_var_1
	)}

happyReduce_27 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_27 = happySpecReduce_1  10# happyReduction_27
happyReduction_27 happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	happyIn14
		 (happy_var_1
	)}

happyReduce_28 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_28 = happySpecReduce_3  10# happyReduction_28
happyReduction_28 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn14
		 (Op2 "+" happy_var_1 happy_var_3
	)}}

happyReduce_29 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_29 = happySpecReduce_3  10# happyReduction_29
happyReduction_29 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn14
		 (Op2 "*" happy_var_1 happy_var_3
	)}}

happyReduce_30 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_30 = happySpecReduce_3  10# happyReduction_30
happyReduction_30 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn14
		 (Op2 "/" happy_var_1 happy_var_3
	)}}

happyReduce_31 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_31 = happySpecReduce_3  10# happyReduction_31
happyReduction_31 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn14
		 (Op2 "-" happy_var_1 happy_var_3
	)}}

happyReduce_32 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_32 = happySpecReduce_3  10# happyReduction_32
happyReduction_32 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_2 of { (HappyWrap14 happy_var_2) -> 
	happyIn14
		 (happy_var_2
	)}

happyReduce_33 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_33 = happyReduce 4# 11# happyReduction_33
happyReduction_33 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "sin" happy_var_3
	) `HappyStk` happyRest}

happyReduce_34 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_34 = happyReduce 4# 11# happyReduction_34
happyReduction_34 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "cos" happy_var_3
	) `HappyStk` happyRest}

happyReduce_35 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_35 = happyReduce 4# 11# happyReduction_35
happyReduction_35 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "sqrt" happy_var_3
	) `HappyStk` happyRest}

happyReduce_36 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_36 = happyReduce 4# 11# happyReduction_36
happyReduction_36 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "exp" happy_var_3
	) `HappyStk` happyRest}

happyReduce_37 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_37 = happyReduce 4# 11# happyReduction_37
happyReduction_37 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "ln" happy_var_3
	) `HappyStk` happyRest}

happyReduce_38 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_38 = happySpecReduce_3  12# happyReduction_38
happyReduction_38 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 (Op2 "+" happy_var_1 happy_var_3
	)}}

happyReduce_39 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_39 = happySpecReduce_3  12# happyReduction_39
happyReduction_39 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 (Op2 "*" happy_var_1 happy_var_3
	)}}

happyReduce_40 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_40 = happySpecReduce_3  12# happyReduction_40
happyReduction_40 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 (Op2 "/" happy_var_1 happy_var_3
	)}}

happyReduce_41 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_41 = happySpecReduce_3  12# happyReduction_41
happyReduction_41 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 (Op2 "-" happy_var_1 happy_var_3
	)}}

happyReduce_42 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_42 = happySpecReduce_3  12# happyReduction_42
happyReduction_42 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_2 of { (HappyWrap16 happy_var_2) -> 
	happyIn16
		 (happy_var_2
	)}

happyReduce_43 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_43 = happySpecReduce_2  12# happyReduction_43
happyReduction_43 happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_2 of { (HappyWrap16 happy_var_2) -> 
	happyIn16
		 (happy_var_2
	)}

happyReduce_44 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_44 = happySpecReduce_2  12# happyReduction_44
happyReduction_44 happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_2 of { (HappyWrap16 happy_var_2) -> 
	happyIn16
		 (Op1 "-" happy_var_2
	)}

happyReduce_45 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_45 = happySpecReduce_1  12# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn16
		 (Var happy_var_1
	)}

happyReduce_46 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_46 = happySpecReduce_1  12# happyReduction_46
happyReduction_46 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenReal happy_var_1)) -> 
	happyIn16
		 (Real happy_var_1
	)}

happyReduce_47 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_47 = happySpecReduce_1  12# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenInt happy_var_1)) -> 
	happyIn16
		 (IntR happy_var_1
	)}

happyReduce_48 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_48 = happySpecReduce_1  13# happyReduction_48
happyReduction_48 happy_x_1
	 =  happyIn17
		 (True_C
	)

happyReduce_49 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_49 = happySpecReduce_1  13# happyReduction_49
happyReduction_49 happy_x_1
	 =  happyIn17
		 (False_C
	)

happyReduce_50 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_50 = happySpecReduce_3  13# happyReduction_50
happyReduction_50 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_2 of { (HappyWrap17 happy_var_2) -> 
	happyIn17
		 (happy_var_2
	)}

happyReduce_51 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_51 = happySpecReduce_2  13# happyReduction_51
happyReduction_51 happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_2 of { (HappyWrap17 happy_var_2) -> 
	happyIn17
		 (Not happy_var_2
	)}

happyReduce_52 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_52 = happySpecReduce_1  13# happyReduction_52
happyReduction_52 happy_x_1
	 =  case happyOut13 happy_x_1 of { (HappyWrap13 happy_var_1) -> 
	happyIn17
		 (happy_var_1
	)}

happyReduce_53 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_53 = happySpecReduce_3  13# happyReduction_53
happyReduction_53 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn17
		 (OpB "and" happy_var_1 happy_var_3
	)}}

happyReduce_54 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_54 = happySpecReduce_3  13# happyReduction_54
happyReduction_54 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn17
		 (OpB "or" happy_var_1 happy_var_3
	)}}

happyReduce_55 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_55 = happySpecReduce_1  13# happyReduction_55
happyReduction_55 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenBool happy_var_1)) -> 
	happyIn17
		 (Boolean happy_var_1
	)}

happyReduce_56 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_56 = happySpecReduce_1  13# happyReduction_56
happyReduction_56 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn17
		 (VarB happy_var_1
	)}

happyReduce_57 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_57 = happySpecReduce_1  14# happyReduction_57
happyReduction_57 happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn18
		 ([happy_var_1]
	)}

happyReduce_58 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_58 = happySpecReduce_3  14# happyReduction_58
happyReduction_58 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn18
		 (happy_var_1:happy_var_3
	)}}

happyReduce_59 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_59 = happySpecReduce_1  15# happyReduction_59
happyReduction_59 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn19
		 (happy_var_1
	)}

happyReduce_60 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_60 = happySpecReduce_1  15# happyReduction_60
happyReduction_60 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenString happy_var_1)) -> 
	happyIn19
		 (happy_var_1
	)}

happyReduce_61 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_61 = happySpecReduce_0  16# happyReduction_61
happyReduction_61  =  happyIn20
		 ([]
	)

happyReduce_62 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_62 = happySpecReduce_2  16# happyReduction_62
happyReduction_62 happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	case happyOut20 happy_x_2 of { (HappyWrap20 happy_var_2) -> 
	happyIn20
		 (happy_var_1:happy_var_2
	)}}

happyReduce_63 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_63 = happySpecReduce_2  17# happyReduction_63
happyReduction_63 happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	happyIn21
		 (EvalSingleB happy_var_1
	)}

happyReduce_64 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_64 = happySpecReduce_2  17# happyReduction_64
happyReduction_64 happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	happyIn21
		 (EvalSingleR happy_var_1
	)}

happyReduce_65 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_65 = happyReduce 4# 17# happyReduction_65
happyReduction_65 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn21
		 (AssignVarR happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_66 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_66 = happyReduce 4# 17# happyReduction_66
happyReduction_66 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn21
		 (AssignVarB happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_67 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_67 = happyReduce 5# 17# happyReduction_67
happyReduction_67 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_3 of { (Token _ (TokenID happy_var_3)) -> 
	happyIn21
		 (VarIO "writeln" happy_var_3
	) `HappyStk` happyRest}

happyReduce_68 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_68 = happyReduce 5# 17# happyReduction_68
happyReduction_68 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn21
		 (FloatIO "writeln" happy_var_3
	) `HappyStk` happyRest}

happyReduce_69 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_69 = happyReduce 5# 17# happyReduction_69
happyReduction_69 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn21
		 (BoolIO "writeln" happy_var_3
	) `HappyStk` happyRest}

happyReduce_70 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_70 = happyReduce 5# 17# happyReduction_70
happyReduction_70 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_3 of { (Token _ (TokenID happy_var_3)) -> 
	happyIn21
		 (ReadIO "writeln" happy_var_3
	) `HappyStk` happyRest}

happyReduce_71 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_71 = happyReduce 5# 17# happyReduction_71
happyReduction_71 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn21
		 (FuncCall happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_72 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_72 = happyReduce 7# 17# happyReduction_72
happyReduction_72 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOutTok happy_x_3 of { (Token _ (TokenID happy_var_3)) -> 
	case happyOut18 happy_x_5 of { (HappyWrap18 happy_var_5) -> 
	happyIn21
		 (AssignFuncCall happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_73 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_73 = happySpecReduce_2  17# happyReduction_73
happyReduction_73 happy_x_2
	happy_x_1
	 =  happyIn21
		 (LoopStop "continue"
	)

happyReduce_74 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_74 = happySpecReduce_2  17# happyReduction_74
happyReduction_74 happy_x_2
	happy_x_1
	 =  happyIn21
		 (LoopStop "break"
	)

happyReduce_75 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_75 = happyReduce 4# 17# happyReduction_75
happyReduction_75 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut20 happy_x_2 of { (HappyWrap20 happy_var_2) -> 
	happyIn21
		 (Block happy_var_2
	) `HappyStk` happyRest}

happyReduce_76 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_76 = happyReduce 8# 17# happyReduction_76
happyReduction_76 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	case happyOut21 happy_x_6 of { (HappyWrap21 happy_var_6) -> 
	case happyOut21 happy_x_8 of { (HappyWrap21 happy_var_8) -> 
	happyIn21
		 (IF happy_var_3 happy_var_6 happy_var_8
	) `HappyStk` happyRest}}}

happyReduce_77 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_77 = happyReduce 6# 17# happyReduction_77
happyReduction_77 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	case happyOut21 happy_x_6 of { (HappyWrap21 happy_var_6) -> 
	happyIn21
		 (WHILE happy_var_3 happy_var_6
	) `HappyStk` happyRest}}

happyReduce_78 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_78 = happyReduce 8# 17# happyReduction_78
happyReduction_78 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOutTok happy_x_4 of { (Token _ (TokenInt happy_var_4)) -> 
	case happyOutTok happy_x_6 of { (Token _ (TokenInt happy_var_6)) -> 
	case happyOut21 happy_x_8 of { (HappyWrap21 happy_var_8) -> 
	happyIn21
		 (FOR happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest}}}}

happyReduce_79 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_79 = happyReduce 13# 17# happyReduction_79
happyReduction_79 (happy_x_13 `HappyStk`
	happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	case happyOutTok happy_x_6 of { (Token _ (TokenBool happy_var_6)) -> 
	case happyOut21 happy_x_8 of { (HappyWrap21 happy_var_8) -> 
	case happyOutTok happy_x_9 of { (Token _ (TokenBool happy_var_9)) -> 
	case happyOut21 happy_x_11 of { (HappyWrap21 happy_var_11) -> 
	happyIn21
		 (CASE happy_var_3 happy_var_6 happy_var_8 happy_var_9 happy_var_11
	) `HappyStk` happyRest}}}}}

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	Token _ TokenEOF -> happyDoAction 55# tk action sts stk;
	Token _ (TokenInt happy_dollar_dollar) -> cont 1#;
	Token _ (TokenReal happy_dollar_dollar) -> cont 2#;
	Token _ (TokenBool happy_dollar_dollar) -> cont 3#;
	Token _ (TokenString happy_dollar_dollar) -> cont 4#;
	Token _ (TokenID happy_dollar_dollar) -> cont 5#;
	Token _ (TokenOp "+") -> cont 6#;
	Token _ (TokenOp "-") -> cont 7#;
	Token _ (TokenOp "*") -> cont 8#;
	Token _ (TokenOp "/") -> cont 9#;
	Token _ (TokenOp "=") -> cont 10#;
	Token _ (TokenOp ":=") -> cont 11#;
	Token _ (TokenOp "<>") -> cont 12#;
	Token _ (TokenOp ">") -> cont 13#;
	Token _ (TokenOp "<") -> cont 14#;
	Token _ (TokenOp ">=") -> cont 15#;
	Token _ (TokenOp "<=") -> cont 16#;
	Token _ (TokenK  "(") -> cont 17#;
	Token _ (TokenK  ")") -> cont 18#;
	Token _ (TokenK "begin") -> cont 19#;
	Token _ (TokenK "end.") -> cont 20#;
	Token _ (TokenK "boolean") -> cont 21#;
	Token _ (TokenK "real") -> cont 22#;
	Token _ (TokenK "string") -> cont 23#;
	Token _ (TokenK "var") -> cont 24#;
	Token _ (TokenK "end") -> cont 25#;
	Token _ (TokenK "and") -> cont 26#;
	Token _ (TokenK "or") -> cont 27#;
	Token _ (TokenK "not") -> cont 28#;
	Token _ (TokenK ",") -> cont 29#;
	Token _ (TokenOp ":") -> cont 30#;
	Token _ (TokenK "program") -> cont 31#;
	Token _ (TokenK "sin") -> cont 32#;
	Token _ (TokenK "cos") -> cont 33#;
	Token _ (TokenK "sqrt") -> cont 34#;
	Token _ (TokenK "exp") -> cont 35#;
	Token _ (TokenK "ln") -> cont 36#;
	Token _ (TokenK "writeln") -> cont 37#;
	Token _ (TokenK "break") -> cont 38#;
	Token _ (TokenK "continue") -> cont 39#;
	Token _ (TokenK "if") -> cont 40#;
	Token _ (TokenK "then") -> cont 41#;
	Token _ (TokenK "else") -> cont 42#;
	Token _ (TokenK "while") -> cont 43#;
	Token _ (TokenK "for") -> cont 44#;
	Token _ (TokenK "case") -> cont 45#;
	Token _ (TokenK "function") -> cont 46#;
	Token _ (TokenK "procedure") -> cont 47#;
	Token _ (TokenK "of") -> cont 48#;
	Token _ (TokenK "to") -> cont 49#;
	Token _ (TokenK "do") -> cont 50#;
	Token _ (TokenK ";") -> cont 51#;
	Token _ (TokenK "true") -> cont 52#;
	Token _ (TokenK "false") -> cont 53#;
	Token _ (TokenK "false") -> cont 54#;
	_ -> happyError' (tk, [])
	})

happyError_ explist 55# tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen = (thenP)
happyReturn :: () => a -> Parser a
happyReturn = (returnP)
happyParse :: () => Happy_GHC_Exts.Int# -> Parser (HappyAbsSyn )

happyNewToken :: () => Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyDoAction :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyReduceArr :: () => Happy_Data_Array.Array Int (Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn ))

happyThen1 :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen1 = happyThen
happyReturn1 :: () => a -> Parser a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [String]) -> Parser a
happyError' tk = (\(tokens, explist) -> happyError) tk
happyParser = happySomeParser where
 happySomeParser = happyThen (happyParse 0#) (\x -> happyReturn (let {(HappyWrap4 x') = happyOut4 x} in x'))

happySeq = happyDontSeq



{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
