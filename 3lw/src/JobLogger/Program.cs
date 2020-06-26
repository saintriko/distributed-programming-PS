using System;
using NATS.Client;
using Subscriber;

namespace JobLogger
{
    class Program
    {
        static void Main(string[] args)
        {
           var loggerservice = new LoggerService();


            using(IConnection connection = new ConnectionFactory().CreateConnection(ConnectionFactory.GetDefaultOptions())){
                loggerservice.Run(connection);
                Console.ReadKey();
            }
        }
    }
}
