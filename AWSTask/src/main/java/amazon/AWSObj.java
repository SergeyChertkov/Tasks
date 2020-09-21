package amazon;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class AWSObj {
    protected long id;
    protected String name;
    protected String type;
    protected String state;
    protected String region;
    protected long attachedInstanceId;
    protected long sourceVolumeId;

    /**
     * Create list of AWS objects from data
     *
     * @param awsType one of AWS type (INSTANCE, SNAPSHOT, VOLUME)
     * @param dataStr string data f.e.: id:1100,type:micro,state:running,region:oregon
     * @return list of AWS objects
     */
    public static List<AWSObj> parseAwsData(AwsType awsType, String dataStr) {
        List<AWSObj> awsObjList = new ArrayList<>();
        for (String entity : dataStr.split("%")) {
            switch (awsType) {
                case INSTANCE:
                    awsObjList.add(new AWSInstance(entity));
                    break;
                case SNAPSHOT:
                    awsObjList.add(new AWSSnapshot(entity));
                    break;
                case VOLUME:
                    awsObjList.add(new AWSVolume(entity));
                    break;
            }

        }
        return awsObjList;
    }

    /**
     * Lookup function that find subset of AWS objects (from awsObjList) by properties and values
     *
     * @param awsObjList  list of AWS objects for searching
     * @param propertyMap property map for filtering
     * @return list of AWS objects
     */
    public static List<AWSObj> awsLookup(List<AWSObj> awsObjList, Map<String, Object> propertyMap) {
        List<AWSObj> resultAwsObjList = new ArrayList<>(awsObjList);
        if (propertyMap.containsKey("id")) {
            resultAwsObjList.removeIf(awsEntity -> awsEntity.id != (long) propertyMap.get("id"));
        }
        if (propertyMap.containsKey("name")) {
            resultAwsObjList.removeIf(awsEntity -> (awsEntity.name == null && propertyMap.get("name") != null) || !awsEntity.name.equalsIgnoreCase(propertyMap.get("name").toString()));
        }
        if (propertyMap.containsKey("type")) {
            resultAwsObjList.removeIf(awsEntity -> (awsEntity.type == null && propertyMap.get("type") != null) || !awsEntity.type.equalsIgnoreCase(propertyMap.get("type").toString()));
        }
        if (propertyMap.containsKey("state")) {
            resultAwsObjList.removeIf(awsEntity -> (awsEntity.state == null && propertyMap.get("state") != null) || !awsEntity.state.equalsIgnoreCase(propertyMap.get("state").toString()));
        }
        if (propertyMap.containsKey("region")) {
            resultAwsObjList.removeIf(awsEntity -> (awsEntity.region == null && propertyMap.get("region") != null) || !awsEntity.region.equalsIgnoreCase(propertyMap.get("region").toString()));
        }
        if (propertyMap.containsKey("attachedInstanceId")) {
            resultAwsObjList.removeIf(awsEntity -> awsEntity.attachedInstanceId != (long) propertyMap.get("attachedInstanceId"));
        }
        if (propertyMap.containsKey("sourceVolumeId")) {
            resultAwsObjList.removeIf(awsEntity -> awsEntity.sourceVolumeId != (long) propertyMap.get("sourceVolumeId"));
        }
        return resultAwsObjList;
    }

}
