<?xml version="1.0"?>
<!-- We use 2 languages and have to mix indent of both, in this case vim isn't so smart -->
<!-- vim: set nosi ai indentexpr= et ts=4 sw=4: -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" indent="yes" />
<xsl:preserve-space elements="*" />
<xsl:template match="/MxConvert">/*
 * Lab# - Matlab interaction library for .Net
 * 
 * Copyright (C) 2005 Julien Roncaglia
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
        const string ONE_ELEMENT_REQUIRED = "A mxArray with only 1 element is required.";
        const string NO_WAY_TO_CAST = "Cannot cast a {0} mxArray to {1}.";
        const string NO_DOTNET_TYPE = "No corresponding .Net type exists for {0}.";

        /// &lt;summary&gt;
        /// Convert a mxArray to the corresponding type of array.
        /// &lt;/summary&gt;
        /// &lt;remarks&gt;
        /// No conversion of type occurs, if the ClassID is Single, a float[] will be
        /// returned and never a double[].
        /// &lt;/remarks&gt;
        static Array _ConvertToArray(MxArray array, ClassID classId, int ndims)
        {
            bool isComplex = array.IsComplex;
            switch (classId)
            {
                <xsl:apply-templates select="Convert" mode="_ConvertToArray" />
                default:
                    throw new InvalidCastException(string.Format(NO_DOTNET_TYPE, classId));
            }
        }

        /// &lt;summary&gt;
        /// Convert a mxArray to the corresponding basic object (Not an array).
        /// &lt;/summary&gt;
        /// &lt;remarks&gt;
        /// No conversion of type occurs, if the ClassID is Single, a float will be
        /// returned and never a double.
        /// &lt;/remarks&gt;        
        static Object _ConvertToBasicType(MxArray array, ClassID classId)
        {
            switch(classId)
            {
                <xsl:apply-templates select="Convert" mode="_ConvertToBasicType" />
                default:
                    throw new InvalidCastException(string.Format(NO_DOTNET_TYPE, classId));
            }
        }

        /// &lt;summary&gt;
        /// Try to convert a mxArray a specified .Net type.
        /// &lt;/summary&gt;
        /// &lt;remarks&gt;
        /// &lt;para&gt;
        ///     A conversion could occurs, if you ask for a double[,] but the content is
        ///     a 2 dimensions mxArray of Single it will be converted to a double[,].
        /// &lt;/para&gt;
        /// &lt;/remarks&gt;        
        /// &lt;param name="noVectorization"&gt;
        /// If this parametter is true and the user ask for a 1D array an exception will 
        /// be thrown if the mxArray isn't of dimension 1, otherwise it will vectorize the array.
        /// &lt;/param&gt;
        static TType _ConvertToSomeType&lt;TType&gt;(MxArray array, ClassID classId, int ndims, bool noVectorization)
        {
            Type genericType = typeof(TType);
            Type convertToDataType;
            // There is two sorts of Array types : the ones that answer true to IsArray, where we could
            // get dimensions, element type and other details; and the Array class that could contain
            // any array.
            bool isArray = genericType.IsArray;
            bool isComplexMxArray = array.IsComplex;
            if (isArray)
            {
                convertToDataType =genericType.GetElementType();
            }
            else
            {
                convertToDataType = genericType;
            }
            bool isComplexType = convertToDataType.IsGenericType
                &amp;&amp; (convertToDataType.GetGenericTypeDefinition() == typeof(Complex&lt;&gt;));
            if (isComplexType)
            {
                convertToDataType = convertToDataType.GetGenericArguments()[0];
            }

            <xsl:apply-templates select="Convert" mode="_ConvertToSomeType" />
                throw new InvalidCastException(string.Format(NO_WAY_TO_CAST, classId, typeof(TType).Name));
        }

        <xsl:apply-templates select="Convert" mode="ConvertToFunctions" />
    }
}
</xsl:template>

<xsl:template match="Convert" mode="_ConvertToArray">
                case ClassID.<xsl:value-of select="@matlabType" />:
                    if (isComplex)
                    {
                        return _To<xsl:value-of select="@name" />Array_Cplx(array);             
                    }
                    else
                    {
                        return _To<xsl:value-of select="@name" />Array(array);             
                    }
</xsl:template>

<xsl:template match="Convert" mode="_ConvertToBasicType">
                case ClassID.<xsl:value-of select="@matlabType" />:
                    if (array.IsComplex)
                    {
                        return _To<xsl:value-of select="@name" />_Cplx(array);
                    }
                    else
                    {
                        return _To<xsl:value-of select="@name" />(array);
                    }
</xsl:template>

<xsl:template match="Convert" mode="_ConvertToSomeType">
    if (convertToDataType == typeof(<xsl:value-of select="@csharpType" />))
    {
        if (isComplexType)
        {
            if (isArray)
            {
                int rank = genericType.GetArrayRank();

                if ( (rank == 1) &amp;&amp; (!noVectorization) )
                {
                    return (TType)(Object)_To<xsl:value-of select="@name" />Array1D_Cplx(array);
                }
                else
                {
                    if (rank != ndims)
                    {
                        throw new InvalidCastException(string.Format(
                            "The mxArray have {0} dimensions but the result have {1}, no way to convert", ndims, rank));
                    }
                    return (TType)(Object)_To<xsl:value-of select="@name" />Array_Cplx(array);
                }
            }
            else
            {
                return (TType)(Object)_To<xsl:value-of select="@name" />_Cplx(array);
            }
        }
        else
        {
            if (isArray)
            {
                int rank = genericType.GetArrayRank();

                if ( (rank == 1) &amp;&amp; (!noVectorization) )
                {
                    return (TType)(Object)_To<xsl:value-of select="@name" />Array1D(array);
                }
                else
                {
                    if (rank != ndims)
                    {
                        throw new InvalidCastException(string.Format(
                            "The mxArray have {0} dimensions but the result have {1}, no way to convert", ndims, rank));
                    }
                    return (TType)(Object)_To<xsl:value-of select="@name" />Array(array);
                }
            }
            else
            {
                return (TType)(Object)_To<xsl:value-of select="@name" />(array);
            }
        }
    }
    else
</xsl:template>

<xsl:template name="case-convert-to">
<xsl:param name="from" /><!-- Node du type contenu dans le mxArray -->
<xsl:param name="to" /><!-- Node du type pour le return -->
                case ClassID.<xsl:value-of select="$from/@matlabType" /> :
                {
                    <xsl:value-of select="$from/@csharpType" />* pr;
                    pr = (<xsl:value-of select="$from/@csharpType" />*)array.RealElements;                
                    <xsl:choose>
                    <xsl:when test="$from = $to">
                    return *pr;
                    </xsl:when>
                    <xsl:otherwise>
                    return (<xsl:value-of select="$to/@csharpType" />)(*pr);
                    </xsl:otherwise>
                    </xsl:choose>
                }
</xsl:template>

<xsl:template name="case-convert-to-cplx">
<xsl:param name="from" /><!-- Node du type contenu dans le mxArray -->
<xsl:param name="to" /><!-- Node du type pour le return -->
                case ClassID.<xsl:value-of select="$from/@matlabType" /> :
                {
                    <xsl:value-of select="$to/@csharpType" /> defaultValue;
                    defaultValue = default(<xsl:value-of select="$to/@csharpType" />);

                    <xsl:value-of select="$from/@csharpType" />* pr, pi;    
                    pr = (<xsl:value-of select="$from/@csharpType" />*)array.RealElements;
                    pi = (<xsl:value-of select="$from/@csharpType" />*)array.ImaginaryElements;
                    Complex&lt;<xsl:value-of select="$to/@csharpType" />&gt; result;
                    <xsl:choose>
                    <xsl:when test="$from = $to">
                    result = new Complex&lt;<xsl:value-of select="$to/@csharpType" />&gt;(*pr,
                        pi != null ? *pi : defaultValue);
                    </xsl:when>
                    <xsl:otherwise>
                    result = new Complex&lt;<xsl:value-of select="$to/@csharpType" />&gt;(
                        (<xsl:value-of select="$to/@csharpType" />)(*pr),
                        pi != null ? (<xsl:value-of select="$to/@csharpType" />)(*pi) : defaultValue);
                    </xsl:otherwise>
                    </xsl:choose>
                    return result;
                }
</xsl:template>

<xsl:template name="case-convert-to-1darray">
<xsl:param name="from" /><!-- Node du type contenu dans le mxArray -->
<xsl:param name="to" /><!-- Node du type pour le return -->
                case ClassID.<xsl:value-of select="$from/@matlabType" /> :
                {
                    <xsl:value-of select="$from/@csharpType" />* p;
                    p = (<xsl:value-of select="$from/@csharpType" />*)array.RealElements;
                    for(int i = 0 ; i &lt; count; i++)
                    {
                        <xsl:choose>
                        <xsl:when test="$from = $to">
                        result[i] = *p++;
                        </xsl:when>
                        <xsl:otherwise>
                        result[i] = (<xsl:value-of select="$to/@csharpType" />)(*p++);
                        </xsl:otherwise>
                        </xsl:choose>
                    }
                    break;
                }
</xsl:template>

<xsl:template name="case-convert-to-1darray-cplx">
<xsl:param name="from" /><!-- Node du type contenu dans le mxArray -->
<xsl:param name="to" /><!-- Node du type pour le return -->
                case ClassID.<xsl:value-of select="$from/@matlabType" /> :
                {
                    <xsl:value-of select="$to/@csharpType" /> defaultValue;
                    defaultValue = default(<xsl:value-of select="$to/@csharpType" />);

                    <xsl:value-of select="$from/@csharpType" />* pr, pi;
                    pr = (<xsl:value-of select="$from/@csharpType" />*)array.RealElements;
                    pi = (<xsl:value-of select="$from/@csharpType" />*)array.ImaginaryElements;
                   
                    for(int i = 0 ; i &lt; count; i++)
                    {
                        <xsl:choose>
                        <xsl:when test="$from = $to">
                        result[i] = new Complex&lt;<xsl:value-of select="$to/@csharpType" />&gt;(*pr++,
                            pi != null ? *pi++ : defaultValue);
                        </xsl:when>
                        <xsl:otherwise>
                        result[i] = new Complex&lt;<xsl:value-of select="$to/@csharpType" />&gt;(
                            (<xsl:value-of select="$to/@csharpType" />)(*pr++),
                            pi != null ? (<xsl:value-of select="$to/@csharpType" />)(*pi++) : defaultValue);
                        </xsl:otherwise>
                        </xsl:choose>                    
                    }
                    break;
                }
</xsl:template>

<xsl:template name="case-convert-to-array">
<xsl:param name="from" /><!-- Node du type contenu dans le mxArray -->
<xsl:param name="to" /><!-- Node du type pour le return -->
                case ClassID.<xsl:value-of select="$from/@matlabType" /> :
                {
                    <xsl:value-of select="$from/@csharpType" />* p;
                    p = (<xsl:value-of select="$from/@csharpType" />*)array.RealElements;
                    for(int i = 0 ; i &lt; count; i++)
                    {
                        //TODO: Optimize the coordinate table generation by not re-calculating it every time.
                        coords = MxUtils.CoordinatesFromIndex(i, dims);
                        <xsl:choose>
                        <xsl:when test="$from = $to">
                        result.SetValue(*p++, coords);
                        </xsl:when>
                        <xsl:otherwise>
                        result.SetValue((<xsl:value-of select="$to/@csharpType" />)(*p++), coords);
                        </xsl:otherwise>
                        </xsl:choose>
                    }
                    break;
                }
</xsl:template>

<xsl:template name="case-convert-to-array-cplx">
<xsl:param name="from" /><!-- Node du type contenu dans le mxArray -->
<xsl:param name="to" /><!-- Node du type pour le return -->
                case ClassID.<xsl:value-of select="$from/@matlabType" /> :
                {
                    <xsl:value-of select="$to/@csharpType" /> defaultValue;
                    defaultValue = default(<xsl:value-of select="$to/@csharpType" />);

                    <xsl:value-of select="$from/@csharpType" />* pr, pi;
                    pr = (<xsl:value-of select="$from/@csharpType" />*)array.RealElements;
                    pi = (<xsl:value-of select="$from/@csharpType" />*)array.ImaginaryElements;
                    Complex&lt;<xsl:value-of select="$to/@csharpType" />&gt; element;
                    for(int i = 0 ; i &lt; count; i++)
                    {
                        //TODO: Optimize the coordinate table generation by not re-calculating it every time.
                        coords = MxUtils.CoordinatesFromIndex(i, dims);
                        <xsl:choose>
                        <xsl:when test="$from = $to">
                        element = new Complex&lt;<xsl:value-of select="$to/@csharpType" />&gt;(*pr++,
                            pi != null ? *pi++ : defaultValue);
                        </xsl:when>
                        <xsl:otherwise>
                        element = new Complex&lt;<xsl:value-of select="$to/@csharpType" />&gt;(
                            (<xsl:value-of select="$to/@csharpType" />)(*pr++),
                            pi != null ? (<xsl:value-of select="$to/@csharpType" />)(*pi++) : defaultValue);
                        </xsl:otherwise>
                        </xsl:choose>
                        result.SetValue(element, coords);
                    }
                    break;
                }
</xsl:template>

<xsl:template match="Convert" mode="ConvertToFunctions">
        #region Convert to <xsl:value-of select="@name" />
        
        public unsafe static <xsl:value-of select="@csharpType" /> _To<xsl:value-of select="@name" />(MxArray array)
        {
            if (array == null) throw new ArgumentNullException("array");
            if (array.NumberOfElements != 1)
                throw new InvalidCastException(ONE_ELEMENT_REQUIRED);
            ClassID classId = array.Class;
            bool isComplex = array.IsComplex;   
            switch(classId)
            {
                <xsl:for-each select="CastFrom">
                    <xsl:variable name="currentMatlabType" select="@matlabType" />
                    <xsl:call-template name="case-convert-to">
                        <xsl:with-param name="to" select=".." />
                        <xsl:with-param name="from" select="/MxConvert/Convert[@matlabType=$currentMatlabType]" />
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:call-template name="case-convert-to">
                    <xsl:with-param name="to" select="self::*" />
                    <xsl:with-param name="from" select="self::*" />
                </xsl:call-template>
                default:
                    throw new Exception(string.Format(NO_WAY_TO_CAST, classId, "<xsl:value-of select="@csharpType" />"));
            }
        }

        public unsafe static Complex&lt;<xsl:value-of select="@csharpType" />&gt; _To<xsl:value-of select="@name" />_Cplx(MxArray array)
        {
            if (array == null) throw new ArgumentNullException("array");
            if (array.NumberOfElements != 1)
                throw new InvalidCastException(ONE_ELEMENT_REQUIRED);
            ClassID classId = array.Class;
            bool isComplex = array.IsComplex;   
            switch(classId)
            {
                <xsl:for-each select="CastFrom">
                    <xsl:variable name="currentMatlabType" select="@matlabType" />
                    <xsl:call-template name="case-convert-to-cplx">
                        <xsl:with-param name="to" select=".." />
                        <xsl:with-param name="from" select="/MxConvert/Convert[@matlabType=$currentMatlabType]" />
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:call-template name="case-convert-to-cplx">
                    <xsl:with-param name="to" select="self::*" />
                    <xsl:with-param name="from" select="self::*" />
                </xsl:call-template>
                default:
                    throw new Exception(string.Format(NO_WAY_TO_CAST, classId,
                        "Complex&lt;<xsl:value-of select="@csharpType" />&gt;"));
            }
        }

        public unsafe static <xsl:value-of select="@csharpType" />[] _To<xsl:value-of select="@name" />Array1D(MxArray array)
        {
            if (array == null) throw new ArgumentNullException("array");
            int count = array.NumberOfElements;
            ClassID classId = array.Class;
            <xsl:value-of select="@csharpType" />[] result = new <xsl:value-of select="@csharpType" />[count];
                
            switch(classId)
            {
                <xsl:for-each select="CastFrom">
                <xsl:variable name="currentMatlabType" select="@matlabType" />
                <xsl:call-template name="case-convert-to-1darray">
                    <xsl:with-param name="to" select=".." />
                    <xsl:with-param name="from" select="/MxConvert/Convert[@matlabType=$currentMatlabType]" />
                </xsl:call-template>
                </xsl:for-each>
                <xsl:call-template name="case-convert-to-1darray">
                    <xsl:with-param name="to" select="self::*" />
                    <xsl:with-param name="from" select="self::*" />
                </xsl:call-template>
                default:
                    throw new InvalidCastException(string.Format(NO_WAY_TO_CAST, classId, "<xsl:value-of select="@csharpType" />"));
            }
            
            return result;
        }

        public unsafe static Complex&lt;<xsl:value-of select="@csharpType" />&gt;[] _To<xsl:value-of select="@name" />Array1D_Cplx(MxArray array)
        {
            if (array == null) throw new ArgumentNullException("array");
            int count = array.NumberOfElements;
            ClassID classId = array.Class;
            Complex&lt;<xsl:value-of select="@csharpType" />&gt;[] result;
            result = new Complex&lt;<xsl:value-of select="@csharpType" />&gt;[count];
                
            switch(classId)
            {
                <xsl:for-each select="CastFrom">
                <xsl:variable name="currentMatlabType" select="@matlabType" />
                <xsl:call-template name="case-convert-to-1darray-cplx">
                    <xsl:with-param name="to" select=".." />
                    <xsl:with-param name="from" select="/MxConvert/Convert[@matlabType=$currentMatlabType]" />
                </xsl:call-template>
                </xsl:for-each>
                <xsl:call-template name="case-convert-to-1darray-cplx">
                    <xsl:with-param name="to" select="self::*" />
                    <xsl:with-param name="from" select="self::*" />
                </xsl:call-template>
                default:
                    throw new InvalidCastException(string.Format(NO_WAY_TO_CAST, classId, "<xsl:value-of select="@csharpType" />"));
            }
            
            return result;
        }

        public unsafe static Array _To<xsl:value-of select="@name" />Array(MxArray array)
        {
            if (array == null) throw new ArgumentNullException("array");
            int count = array.NumberOfElements;
            int[] dims = array.Dimensions;
            Array result;
            ClassID classId = array.Class;
                
            int[] coords;

            result = Array.CreateInstance(typeof(<xsl:value-of select="@csharpType" />), dims);
            switch(classId)
            {
                <xsl:for-each select="CastFrom">
                <xsl:variable name="currentMatlabType" select="@matlabType" />
                <xsl:call-template name="case-convert-to-array">
                    <xsl:with-param name="to" select=".." />
                    <xsl:with-param name="from" select="/MxConvert/Convert[@matlabType=$currentMatlabType]" />
                </xsl:call-template>
                </xsl:for-each>
                <xsl:call-template name="case-convert-to-array">
                    <xsl:with-param name="to" select="self::*" />
                    <xsl:with-param name="from" select="self::*" />
                </xsl:call-template>
                default:
                    throw new Exception(string.Format(NO_WAY_TO_CAST, classId,
                        "<xsl:value-of select="@csharpType" />"));
            }
            
            return result;
        }

        public unsafe static Array _To<xsl:value-of select="@name" />Array_Cplx(MxArray array)
        {
            if (array == null) throw new ArgumentNullException("array");
            int count = array.NumberOfElements;
            int[] dims = array.Dimensions;
            Array result;
            ClassID classId = array.Class;
                
            int[] coords;

            result = Array.CreateInstance(typeof(Complex&lt;<xsl:value-of select="@csharpType" />&gt;), dims);
            switch(classId)
            {
                <xsl:for-each select="CastFrom">
                <xsl:variable name="currentMatlabType" select="@matlabType" />
                <xsl:call-template name="case-convert-to-array-cplx">
                    <xsl:with-param name="to" select=".." />
                    <xsl:with-param name="from" select="/MxConvert/Convert[@matlabType=$currentMatlabType]" />
                </xsl:call-template>
                </xsl:for-each>
                <xsl:call-template name="case-convert-to-array-cplx">
                    <xsl:with-param name="to" select="self::*" />
                    <xsl:with-param name="from" select="self::*" />
                </xsl:call-template>
                default:
                    throw new Exception(string.Format(NO_WAY_TO_CAST, classId,
                        "Complex&lt;<xsl:value-of select="@csharpType" />&gt;"));
            }                
            
            return result;
        }

        #endregion
</xsl:template>

</xsl:stylesheet>
