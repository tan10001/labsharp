using System;
using System.Collections.Generic;
using System.Text;
using NUnit.Framework;

namespace LabSharp.Tests
{
    [TestFixture]
    public class ReadNonArrayComplexes
    {
        Engine m_eng;
        MxArray m_temp;

        [SetUp]
        public void Setup()
        {
            m_eng = Engine.Open(false);
            m_temp = m_eng.GetVariable("cplx");
        }

        [TearDown]
        public void TearDown()
        {
            if (m_temp != null)
            {
                m_eng.SetVariable("cplx", m_temp);
                m_temp.Destroy();
            }
            else
            {
                m_eng.Eval("clear cplx");
            }
        }

        [Test]
        public void ReadComplexImplicit()
        {
            m_eng.Eval("cplx = 3.5 + 2.6 * i");
            Complex<double> cplx = (Complex<double>)m_eng.GetVariable<Object>("cplx");
            Assert.AreEqual(cplx.RealPart, 3.5, "Real part");
            Assert.AreEqual(cplx.ImaginaryPart, 2.6, "Imaginary part");
        }

        [Test]
        public void ReadComplexArrayType()
        {
            m_eng.Eval("cplx = 3.5 + 2.6 * i");
            Complex<double>[,] cplx = (Complex<double>[,])m_eng.GetVariable<Array>("cplx");
            Assert.AreEqual(cplx[0, 0].RealPart, 3.5, "Real part");
            Assert.AreEqual(cplx[0, 0].ImaginaryPart, 2.6, "Imaginary part");
        }

        [Test]
        public void ReadComplexGoodType()
        {
            m_eng.Eval("cplx = 3.5 + 2.6 * i");
            Complex<double> cplx = m_eng.GetVariable<Complex<double>>("cplx");
            Assert.AreEqual(cplx.RealPart, 3.5, "Real part");
            Assert.AreEqual(cplx.ImaginaryPart, 2.6, "Imaginary part");
        }

        [Test]
        public void ReadComplexGoodTypeFromReal()
        {
            m_eng.Eval("cplx = 3.5");
            Complex<double> cplx = m_eng.GetVariable<Complex<double>>("cplx");
            Assert.AreEqual(cplx.RealPart, 3.5, "Real part");
            Assert.AreEqual(cplx.ImaginaryPart, 0, "Imaginary part");
        }

        [Test]
        public void ReadComplexOtherType()
        {
            m_eng.Eval("cplx = int16(3 + 2 * i)");
            Complex<double> cplx = m_eng.GetVariable<Complex<double>>("cplx");
            Assert.AreEqual(cplx.RealPart, 3, "Real part");
            Assert.AreEqual(cplx.ImaginaryPart, 2, "Imaginary part");
        }

        [Test]
        public void ReadComplexOtherTypeFromReal()
        {
            m_eng.Eval("cplx = int16(3)");
            Complex<double> cplx = m_eng.GetVariable<Complex<double>>("cplx");
            Assert.AreEqual(cplx.RealPart, 3, "Real part");
            Assert.AreEqual(cplx.ImaginaryPart, 0, "Imaginary part");
        }

        [Test]
        [ExpectedException(typeof(InvalidCastException))]
        public void ReadComplexBadType()
        {
            m_eng.Eval("cplx = 'hello world'");
            m_eng.GetVariable<Complex<double>>("cplx");
        }
    }
}
