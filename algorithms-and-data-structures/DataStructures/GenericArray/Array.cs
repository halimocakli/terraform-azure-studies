using System.Collections;


namespace DataStructures.GenericArray
{
    public class Array<T> : IEnumerable<T>, ICloneable
    {
        private T[] InnerList;
        public int Count { get; private set; }
        public int? Capacity => InnerList.Length;

        public Array()
        {
            InnerList = new T[2];
            Count = 0;
        }

        public Array(params T[] initial)
        {
            InnerList = new T[initial.Length];
            Count = 0;

            foreach (var item in initial)
            {
                Add(item);
            }
        }

        public Array(IEnumerable<T> initialCollection)
        {
            InnerList = new T[initialCollection.Count()];
            Count = 0;

            foreach (var item in initialCollection)
            {
                Add(item);
            }
        }

        public void Add(T item)
        {
            if (InnerList.Length == Count)
            {
                DoubleArrayLength();
            }
            InnerList[Count] = item;
            Count = Count + 1;
        }

        public T Remove()
        {
            if (Count == 0)
            {
                throw new Exception("There is no more item to be removed from the array.");
            }
            else
            {
                T penultimateItem = InnerList[Count - 1];
                Count = Count - 1;

                if (InnerList.Length / 2 == Count && Count != 1)
                {
                    CutArrayLengthHalf();
                }

                return penultimateItem;
            }
        }

        /*
            InnerList yapısının dinamik olarak genişleyebilmesini sağlayan metot.
            Buna göre, metot çağrııher seferinde InnerList genişliği iki katına çıkar.
        */
        private void DoubleArrayLength()
        {
            T[] swapArray = new T[InnerList.Length * 2];
            System.Array.Copy(InnerList, swapArray, InnerList.Length);
            InnerList = swapArray;
        }

        //   InnerList yapısının dinamik olarak küçülmesini sağlayan metot.
        private void CutArrayLengthHalf()
        {
            T[] swapArray = new T[InnerList.Length / 2];
            System.Array.Copy(InnerList, swapArray, swapArray.Length);
            InnerList = swapArray;
        }

        public object Clone()
        {
            return this.MemberwiseClone();
        }

        // Dizi üzerindeki her bir elemana erişmemizi sağlar
        public IEnumerator<T> GetEnumerator()
        {
            return InnerList.Take(Count).GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }
}

