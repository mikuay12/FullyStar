//package com.RealtimeClaculation;
//
//import org.apache.flink.api.common.serialization.SimpleStringSchema;
//import org.apache.flink.api.common.state.ValueState;
//import org.apache.flink.api.common.state.ValueStateDescriptor;
//import org.apache.flink.configuration.Configuration;
//import org.apache.flink.runtime.state.filesystem.FsStateBackend;
//import org.apache.flink.streaming.api.CheckpointingMode;
//import org.apache.flink.streaming.api.environment.CheckpointConfig;
//import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
//import org.apache.flink.streaming.api.functions.KeyedProcessFunction;
//import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer;
//import org.apache.flink.streaming.connectors.kafka.FlinkKafkaProducer;
//import org.apache.flink.util.Collector;
//
//import java.util.Properties;
//
///**
// * @author liuanbo
// * @creat 2024-05-17-17:57
// * @see 2194550857@qq.com
// */
//public class Flink01_State_Checkpoint {
//    public static void main(String[] args) throws Exception {
//        System.setProperty("HADOOP_USER_NAME", "hkbigdata");
//
//        Properties properties = new Properties();
//        properties.setProperty("bootstrap.servers", "hadoop102:9092,hadoop103:9092,hadoop104:9092");
//        properties.setProperty("group.id", "Flink01_Source_Kafka");
//        properties.setProperty("auto.offset.reset", "latest");
//
//        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment()
////                .createLocalEnvironmentWithWebUI(new Configuration())
//                .setParallelism(3);
//        env.setStateBackend(new FsStateBackend("hdfs://hadoop102:8020/flink/checkpoints/"));
//        // 每 1000ms 开始一次 checkpoint
//        env.enableCheckpointing(1000);
//        // 高级选项：
//        // 设置模式为精确一次 (这是默认值)
//        env.getCheckpointConfig().setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE);
//
//        // 确认 checkpoints 之间的时间会进行 500 ms
//        env.getCheckpointConfig().setMinPauseBetweenCheckpoints(500);
//
//        // Checkpoint 必须在一分钟内完成，否则就会被抛弃
//        env.getCheckpointConfig().setCheckpointTimeout(60000);
//
//        // 同一时间只允许一个 checkpoint 进行
//        env.getCheckpointConfig().setMaxConcurrentCheckpoints(1);
//
//        // 开启在 job 中止后仍然保留的 externalized checkpoints
//        env.getCheckpointConfig().enableExternalizedCheckpoints(CheckpointConfig.ExternalizedCheckpointCleanup.RETAIN_ON_CANCELLATION);
//
//        env
//                .addSource(new FlinkKafkaConsumer<String>("sensor", new SimpleStringSchema(), properties))
//                .map(value -> {
//                    String[] datas = value.split(",");
//                    return new WaterSensor(datas[0], Long.valueOf(datas[1]), Double.valueOf(datas[2]));
//
//                })
//                .keyBy(WaterSensor::getId)
//                .process(new KeyedProcessFunction<String, WaterSensor, String>() {
//                    private ValueState<Double> state;
//                    private Integer count = 0;
//
//                    @Override
//                    public void open(Configuration parameters) throws Exception {
//                        System.out.println("生命周期方法被调用");
//                        state = getRuntimeContext().getState(new ValueStateDescriptor<Double>("state", Double.class));
//
//                    }
//
//                    @Override
//                    public void processElement(WaterSensor value, Context ctx, Collector<String> out) throws Exception {
//                        count++;
//                        Double lastVc = state.value() == null ? 0.0 : state.value();
//                        if (Math.abs(value.getVc() - lastVc) >= 10) {
//                            out.collect(value.getId() + " 红色警报!!!" + "==计算到第几条数据：" + count);
//                        }
//                        state.update(value.getVc());
//                    }
//                })
//                .addSink(new FlinkKafkaProducer<String>("hadoop102:9092", "alert", new SimpleStringSchema()));
//
//        env.execute();
//    }
//}
