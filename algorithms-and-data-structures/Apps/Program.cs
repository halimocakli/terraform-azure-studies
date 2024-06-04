using System;
using System.Collections;
using DataStructures;

namespace Apps
{
    public class Program
    {
        static void Main(string[] args)
        {
            DataStructures.GenericArray.Array<int> arr = new DataStructures
                                                            .GenericArray
                                                            .Array<int>();

            for (int i = 0; i < 12; i++)
            {
                arr.Add(i + 2);
                Console.WriteLine($"{i + 2} has been added to the array");
                Console.WriteLine($"[{arr.Count}/{arr.Capacity}]");
            }

            Console.WriteLine("-------------------------");
            Console.WriteLine("-------------------------");

            for (int i = arr.Count; i > 0; i--)
            {
                Console.WriteLine($"{arr.Remove()} has been removed from the array");
                Console.WriteLine($"[{arr.Count}/{arr.Capacity}]");
            }

        }
    }
}