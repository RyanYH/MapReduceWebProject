package com.sist.hadoop;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class MovieReducer extends Reducer<Text, IntWritable, Text, IntWritable>{
    private IntWritable res=new IntWritable();
    // 반전 [1,1,1,1,1]
	@Override
	protected void reduce(Text key, Iterable<IntWritable> values,
			Reducer<Text, IntWritable, Text, IntWritable>.Context context) throws IOException, InterruptedException {
		int sum=0;
		for(IntWritable v:values)
		{
			sum+=v.get();//Intwriable => int
		}
		res.set(sum); // int -> Intwriable
		context.write(key, res);
		
	}
    
}








