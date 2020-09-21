package amazon;

import org.junit.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static amazon.AwsType.*;

public class AWSObjTest {

    @Test
    public void parseAwsDataTest() {
        Map<AwsType, String> awsEntitiesData = new HashMap<>();
        awsEntitiesData.put(INSTANCE, "id:1100,type:micro,state:running,region:oregon%" +
                "Id:1200,type:large1,state:terminated,region:n.virginia%" +
                "Id:1300,type:xlarge3,state:stopped,region:pasific%" +
                "Id:1400,type:large1,state:running,region:oregon");
        awsEntitiesData.put(VOLUME, "id:2100,name:data1,state:available,region:ohio,attached_instance_id:%" +
                "id:2200,name:data1,state:in-use,region:ohio,attached_instance_id:1100%" +
                "id:2300,name:data2,state:available,region:london,attached_instance_id:1200%" +
                "id:2400,name:data2,state:in-use,region:oregon,attached_instance_id:1300");
        awsEntitiesData.put(SNAPSHOT, "id:3100,name:data1_backup,region:oregon,source_volume_id:2100%" +
                "id:3200,name:data2_backup,region:virginia,source_volume_id:2400%");

        List<AWSObj> awsObjList = new ArrayList<>();
        for (AwsType type : awsEntitiesData.keySet()) {
            awsObjList.addAll(AWSObj.parseAwsData(type, awsEntitiesData.get(type)));
        }

        Map<String, Object> propertyMap = new HashMap();
        propertyMap.put("state", "running");
        propertyMap.put("region", "oregon");

        List<AWSObj> resultAwsObjList = AWSObj.awsLookup(awsObjList, propertyMap);

        System.out.println(resultAwsObjList);
    }
}
