package com.RealtimeClaculation;

import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer;

import java.util.Properties;

/**
 * @author liuanbo
 * @creat 2024-04-10-17:18
 * @see 2194550857@qq.com
 */
public class Flink03_Source_Kafka {
    public static void main(String[] args) throws Exception {
        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
        env.setParallelism(1);
        //1.kafka 配置
        Properties properties = new Properties();
        //1.1 kafka机器地址
        properties.setProperty("bootstrap.servers","centos1:9092,centos2:9092,centos3:9092");
        //1.2 消费者组id
        properties.setProperty("group.id","kafka group01");
        //1.3 消费位置
        properties.setProperty("auto.offset.reset","earliest");

        DataStreamSource<String> stringDataStreamSource = env.addSource(new FlinkKafkaConsumer<String>("customer", new SimpleStringSchema(), properties));

        stringDataStreamSource.print();

        env.execute();

    }
}
