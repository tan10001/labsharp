/*
 * Lab# - Matlab interaction library for .Net
 * 
 * Copyright (C) 2006 Julien Roncaglia
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

/*
 * THIS CODE IS GENERATED BY MxConvert.xsl FROM MxConvert.xml, 
 * DO NOT EDIT DIRECTLY.
 */
using System;
using System.Collections.Generic;
using System.Text;

namespace LabSharp
{
    public static partial class MxConvert
	{
		static MxArray _ToMxArray<TType>(TType value)
		{
			Type genericType = typeof(TType);
            Type convertFromDataType;
            bool isArray;
            bool isComplexType;
			ExtractTypeInfos(genericType, out convertFromDataType, out isArray, out isComplexType);
            
            
            if (convertFromDataType == typeof(char))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromCharArray_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromCharArray(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromChar_Cplx(
                            (Complex<char>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromChar(
                            (char)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(bool))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromBooleanArray_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromBooleanArray(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromBoolean_Cplx(
                            (Complex<bool>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromBoolean(
                            (bool)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(sbyte))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromSByteArray_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromSByteArray(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromSByte_Cplx(
                            (Complex<sbyte>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromSByte(
                            (sbyte)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(byte))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromByteArray_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromByteArray(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromByte_Cplx(
                            (Complex<byte>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromByte(
                            (byte)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(ushort))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromUInt16Array_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromUInt16Array(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromUInt16_Cplx(
                            (Complex<ushort>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromUInt16(
                            (ushort)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(short))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromInt16Array_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromInt16Array(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromInt16_Cplx(
                            (Complex<short>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromInt16(
                            (short)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(uint))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromUInt32Array_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromUInt32Array(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromUInt32_Cplx(
                            (Complex<uint>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromUInt32(
                            (uint)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(int))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromInt32Array_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromInt32Array(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromInt32_Cplx(
                            (Complex<int>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromInt32(
                            (int)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(ulong))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromUInt64Array_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromUInt64Array(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromUInt64_Cplx(
                            (Complex<ulong>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromUInt64(
                            (ulong)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(long))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromInt64Array_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromInt64Array(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromInt64_Cplx(
                            (Complex<long>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromInt64(
                            (long)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(float))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromSingleArray_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromSingleArray(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromSingle_Cplx(
                            (Complex<float>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromSingle(
                            (float)(Object)value);
                    }            
                }
            }
            else

            if (convertFromDataType == typeof(double))
            {
                if (isArray)
                {
                    /*
                    if (isComplexType)
                    {
                         return _MxArrayFromDoubleArray_Cplx(
                            (Array)(Object)value);
                    }
                    else
                    {
                         return _MxArrayFromDoubleArray(
                            (Array)(Object)value);
                    }
                    */
                    return null; // TODO
                }
                else
                {
                    if (isComplexType)
                    {
                        return _MxArrayFromDouble_Cplx(
                            (Complex<double>)(Object)value);
                    }
                    else
                    {
                        return _MxArrayFromDouble(
                            (double)(Object)value);
                    }            
                }
            }
            else

                throw new Exception("Boom!");
        }

        
        unsafe static MxArray _MxArrayFromChar(
            char value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Char, Complexity.Real);
            char* pr;
            pr = (char*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromChar_Cplx(
            Complex<char> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Char, Complexity.Complex);
            char* pr, pi;

            pr = (char*)result.RealElements;
            pi = (char*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromBoolean(
            bool value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Logical, Complexity.Real);
            bool* pr;
            pr = (bool*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromBoolean_Cplx(
            Complex<bool> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Logical, Complexity.Complex);
            bool* pr, pi;

            pr = (bool*)result.RealElements;
            pi = (bool*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromSByte(
            sbyte value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Int8, Complexity.Real);
            sbyte* pr;
            pr = (sbyte*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromSByte_Cplx(
            Complex<sbyte> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Int8, Complexity.Complex);
            sbyte* pr, pi;

            pr = (sbyte*)result.RealElements;
            pi = (sbyte*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromByte(
            byte value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.UInt8, Complexity.Real);
            byte* pr;
            pr = (byte*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromByte_Cplx(
            Complex<byte> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.UInt8, Complexity.Complex);
            byte* pr, pi;

            pr = (byte*)result.RealElements;
            pi = (byte*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromUInt16(
            ushort value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.UInt16, Complexity.Real);
            ushort* pr;
            pr = (ushort*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromUInt16_Cplx(
            Complex<ushort> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.UInt16, Complexity.Complex);
            ushort* pr, pi;

            pr = (ushort*)result.RealElements;
            pi = (ushort*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromInt16(
            short value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Int16, Complexity.Real);
            short* pr;
            pr = (short*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromInt16_Cplx(
            Complex<short> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Int16, Complexity.Complex);
            short* pr, pi;

            pr = (short*)result.RealElements;
            pi = (short*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromUInt32(
            uint value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.UInt32, Complexity.Real);
            uint* pr;
            pr = (uint*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromUInt32_Cplx(
            Complex<uint> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.UInt32, Complexity.Complex);
            uint* pr, pi;

            pr = (uint*)result.RealElements;
            pi = (uint*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromInt32(
            int value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Int32, Complexity.Real);
            int* pr;
            pr = (int*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromInt32_Cplx(
            Complex<int> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Int32, Complexity.Complex);
            int* pr, pi;

            pr = (int*)result.RealElements;
            pi = (int*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromUInt64(
            ulong value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.UInt64, Complexity.Real);
            ulong* pr;
            pr = (ulong*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromUInt64_Cplx(
            Complex<ulong> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.UInt64, Complexity.Complex);
            ulong* pr, pi;

            pr = (ulong*)result.RealElements;
            pi = (ulong*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromInt64(
            long value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Int64, Complexity.Real);
            long* pr;
            pr = (long*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromInt64_Cplx(
            Complex<long> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Int64, Complexity.Complex);
            long* pr, pi;

            pr = (long*)result.RealElements;
            pi = (long*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromSingle(
            float value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Single, Complexity.Real);
            float* pr;
            pr = (float*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromSingle_Cplx(
            Complex<float> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Single, Complexity.Complex);
            float* pr, pi;

            pr = (float*)result.RealElements;
            pi = (float*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        

        unsafe static MxArray _MxArrayFromDouble(
            double value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Double, Complexity.Real);
            double* pr;
            pr = (double*)result.RealElements;
            *pr = value;

            return result;
        }

        unsafe static MxArray _MxArrayFromDouble_Cplx(
            Complex<double> value)
        {
            MxArray result = MxArray.CreateNumericArray(1, new int[] { 1 },
                ClassID.Double, Complexity.Complex);
            double* pr, pi;

            pr = (double*)result.RealElements;
            pi = (double*)result.ImaginaryElements;

            *pr = value.RealPart;
            *pi = value.ImaginaryPart;

            return result;
        }        


	}
}
